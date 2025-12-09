from mcp.server.fastmcp import FastMCP, Context 
from pydantic import BaseModel
import sqlite3
import mailtrap as mt
import dotenv

server = FastMCP("cv-solita")

def get_db_connection() -> sqlite3.Connection:
    db_path = 'db/database.db'
    conn = sqlite3.connect(db_path)
    return conn

def get_all_user_data(name): 
    with open('db/get_user_data.sql', 'r') as file:
        query = file.read()
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, (name,))
    data = cursor.fetchall()
    conn.close()
    return str(data)

@server.resource("resource://schema")
def db_schema():
    with open('db/schema.sql', 'r') as file:
        schema = file.read()
    return schema

@server.tool()
async def get_users(ctx: Context):
    await ctx.info("Fetching all users from the database.")
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT user_name FROM users")
    users = cursor.fetchall()
    conn.close()
    return users

@server.tool()
async def get_user_info(relation, name):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = f"SELECT * FROM {relation} INNER JOIN users ON {relation}.user_id = users.id WHERE users.user_name = ?"
    cursor.execute(query, (name,))
    result = cursor.fetchall()
    conn.close()
    return result

@server.tool()
async def send_email_to(subject: str | None = None, body: str | None = None):
    mailtrap_token = dotenv.get_key(".env", "MAILTRAP_API_TOKEN") or ""
    if not mailtrap_token:
        return "Mailtrap API token is not set."

    mail = mt.Mail(
        sender=mt.Address(email="hello@demomailtrap.com", name="Mailtrap Test"),
        to=[mt.Address(email="matteoboulanger711@gmail.com")],
        subject=subject,
        text=body,
        category="Integration Test",
    )

    client = mt.MailtrapClient(token=mailtrap_token)
    response = client.send(mail)
    logging_info = f"Email sent to: {response.to}, Subject: {response.subject}"
    return logging_info

class UserSchema(BaseModel):
    name: str

@server.prompt("describe-user")
async def describe_user(ctx: Context):
    result = await ctx.elicit("What is the user's name?", schema=UserSchema)
    data = get_all_user_data(result.data.name)
    return (
        f"The following data is available for the user '{result.data.name}':\n"
        f"{data}\n"
        "Provide a concise summary of the user's information based on the data above. If no data is available, state that no information is found."
    )

def main():
    print("Started MCP server...")
    server.run()

if __name__ == "__main__":
    main()