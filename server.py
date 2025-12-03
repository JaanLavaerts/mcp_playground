from typing import Any
import httpx
from mcp.server.fastmcp import FastMCP
import dotenv

server = FastMCP("balldontlie")

API_BASE = "https://api.balldontlie.io/nba/v1"
USER_AGENT = "balldontlie-mcp/1.0"
API_KEY = dotenv.get_key(".env", "BALLDONTLIE_API_KEY") or ""

def format_teams_response(response):
    formatted_text = ""
    for team in response.get("data", []):
        formatted_text += (
            f"Team ID: {team['id']}\n"
            f"Conference: {team['conference']}\n"
            f"Division: {team['division']}\n"
            f"City: {team['city']}\n"
            f"Name: {team['name']}\n"
            f"Full Name: {team['full_name']}\n"
            f"Abbreviation: {team['abbreviation']}\n"
            "----------------------\n"
        )
    return formatted_text

def format_games_response(response):
    formatted_text = ""
    for game in response.get("data", []):
        formatted_text += (
            f"Game ID: {game['id']}\n"
            f"Date: {game['date']}\n"
            f"Home Team: {game['home_team']['full_name']} ({game['home_team_score']})\n"
            f"Visitor Team: {game['visitor_team']['full_name']} ({game['visitor_team_score']})\n"
            "----------------------\n"
        )
    return formatted_text

async def make_request(url: str) -> dict[str, Any] | None:
    headers = {"User-Agent": USER_AGENT, "Authorization": f"Bearer {API_KEY}"} if USER_AGENT else {}
    async with httpx.AsyncClient() as client:
        response = await client.get(url, headers=headers)
        if response.status_code == 200:
            return response.json()
    return None


@server.tool()
async def get_teams(conference: str | None = None, division: str | None = None) -> str:
    url = f"{API_BASE}/teams/"
    params = []
    if conference:
        params.append(f"conference={conference}")
    if division:
        params.append(f"division={division}")
    if params:
        url += "?" + "&".join(params)

    response = await make_request(url)

    if response:
        return format_teams_response(response)

    return "Failed to fetch teams."

    
@server.tool()
async def get_games(date: str | None = None) -> str:
    url = f"{API_BASE}/games/"
    if date:
        url += f"?dates[]={date}"

    response = await make_request(url)

    if response:
        return format_games_response(response)
    
    return "Failed to fetch games."

@server.resource("resource://contacts")
def get_contacts() -> str:
    with open("contacts.txt", "r") as f:
        return f.read()

@server.prompt()
def analyze_file(file_path: str) -> str:
    with open(file_path, "r") as f:
        content = f.read()
    return f"analyze the content of the file at {file_path}:\n\n{content}"



def main():
    print("Started MCP server...")
    server.run()

if __name__ == "__main__":
    main()