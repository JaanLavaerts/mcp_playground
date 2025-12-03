# MCP Playground

## Requirements

- Python 3.13
- [uv](https://docs.astral.sh/uv/) package manager
- SQLite3

## Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd mcp_playground
   ```

2. **Install dependencies with uv**

   ```bash
   uv sync
   ```

3. **Setup the SQLite database**

   1. Create a new SQLite database file using the provided schema.

   ```bash
   cd db
   ```

   ```bash
   sqlite3 database.db < schema.sql
   ```

   2. Insert dummy data into the database.

   ```bash
   sqlite3 database.db < insert_data.sql
   ```

4. **Start the venv (if you want to start the server manually)**

   ```bash
   source .venv/bin/activate
   ```

## Usage

### Starting the server

The server currently uses IO for communication. It is not meant to be started manually but accessed through an MCP client.

### Implemented Functions

The following functions are implemented in the server:

1. **`db_schema` (resource)**

   - Returns the database schema by reading the `schema.sql` file.

2. **`get_users` (tool)**

   - Fetches a list of all user names from the `users` table in the database.

3. **`get_user_info` (tool)**

   - Retrieves detailed information about a user, including data from all related tables (e.g., certificates, projects, degrees, etc.).

4. **`describe_user` (prompt)**

   - Provides a prompt to describe a user by fetching their information using the `get_user_info` function and summarizing it in plain English.

### Integration with Claude Desktop as the MCP client

Add the following configuration to your MCP client (e.g., Claude Desktop):

- Settings → Developer → Edit config → `claude_desktop_config.json`
- `mcpServers`: The server name, in this case `mcp_demo`.
- `command`: The ABSOLUTE path to the `uv` executable on your system.
- `args`: The arguments to start the MCP server, including the ABSOLUTE path to the `mcp_playground` directory.
- Note: Windows paths use backslashes (`\`).

```json
{
  "mcpServers": {
    "mcp_demo": {
      "command": "/path/to/user/.local/bin/uv",
      "args": [
        "--directory",
        "/path/to/user/mcp_playground",
        "run",
        "server.py"
      ]
    }
  }
}
```
