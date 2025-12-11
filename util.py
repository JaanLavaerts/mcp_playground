import sqlite3
import mailtrap as mt
import dotenv

def get_db_connection() -> sqlite3.Connection:
    db_path = 'db/database.db'
    conn = sqlite3.connect(db_path)
    return conn

def execute_query(query: str, params: tuple = ()):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, params)
    result = cursor.fetchall()
    conn.close()
    return result

def send_email_via_mailtrap(subject: str, body: str) -> str:
    mailtrap_token = dotenv.get_key(".env", "MAILTRAP_API_TOKEN") or ""
    if not mailtrap_token:
        return "Mailtrap API token is not set."

    mail = mt.Mail(
        sender=mt.Address(email="hello@demomailtrap.com", name="Mailtrap Test"),
        to=[mt.Address(email="jaan.lavaerts@solita.fi")],
        subject=subject,
        text=body,
        category="Integration Test",
    )

    client = mt.MailtrapClient(token=mailtrap_token)
    response = client.send(mail)
    return response