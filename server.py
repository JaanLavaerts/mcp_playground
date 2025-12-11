from mcp.server.fastmcp import FastMCP 
from util import execute_query, send_email_via_mailtrap
import json

server = FastMCP("cv-solita")

@server.resource("resource://schema")
def db_schema():
    with open('db/schema.sql', 'r') as file:
        schema = file.read()
    return schema

@server.tool()
async def get_users():
    query = "SELECT user_name FROM users"
    users = execute_query(query)
    return users

@server.tool()
async def get_all_employee_profiles():
    with open('db/get_all_employee_profiles.sql', 'r') as file:
        query = file.read()

    rows = execute_query(query)
    return [json.loads(row[0]) for row in rows]

@server.tool()
async def send_email(subject, body) -> str:
    send_email_via_mailtrap(subject, body)
    return "Email sent successfully."

@server.prompt()
async def compose_team_for_project(project_description, team_size):
    return (
        "You are responsible for forming a project team.\n\n"
        f"Project description:\n{project_description}\n\n"

        "First, call the tool `get_all_employee_profiles` once to retrieve "
        "the full list of employees and their skills.\n"
        f"Then analyze the data and propose the top {team_size} candidates.\n"

        "Return final answer with reasoning about why you selected these candidates."
    )

def main():
    print("Started MCP server...")
    server.run()

if __name__ == "__main__":
    main()