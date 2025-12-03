# MCP Playground

## Requirements

- Python 3.13
- [uv](https://docs.astral.sh/uv/) package manager
- An API key from [Ball Don't Lie](https://www.balldontlie.io/)

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

3. **Start the venv (if you want to start the server manually)**

   ```bash
   source .venv/bin/activate
   ```

4. **Configure the API key**

   Create a `.env` file in the root of the project with the following content:

   ```bash
   BALLDONTLIE_API_KEY=your_api_key_here
   ```

## Usage

### Starting the server

The server currently uses IO for communication. It is not meant to be started manually but accessed through an MCP client.

### Integration with MCP clients

Add the following configuration to your MCP client (e.g., Claude Desktop):

- Settings → Developer → Edit config → `claude_desktop_config.json`
- `mcpServers`: The server name, in this case `balldontlie`.
- `command`: The ABSOLUTE path to the `uv` executable on your system.
- `args`: The arguments to start the MCP server, including the ABSOLUTE path to the `mcp_playground` directory.
- Note: Windows paths use backslashes (`\`).

```json
{
  "mcpServers": {
    "balldontlie": {
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

## Available Tools

| Tool        | Description     | Parameters                                     |
| ----------- | --------------- | ---------------------------------------------- |
| `get_teams` | Fetch NBA teams | `conference` (optional), `division` (optional) |
| `get_games` | Fetch NBA games | `date` (optional, format: YYYY-MM-DD)          |

## Available Resources

| Resource              | Description                        |
| --------------------- | ---------------------------------- |
| `resource://contacts` | Reads contacts from `contacts.txt` |

## Available Prompts

| Prompt         | Description                    | Parameters  |
| -------------- | ------------------------------ | ----------- |
| `analyze_file` | Analyzes the content of a file | `file_path` |

## Project Structure

```
mcp_playground/
├── server.py        # MCP server implementation
├── pyproject.toml   # Project configuration and dependencies
├── config.json      # Example MCP server configuration
├── contacts.txt     # Sample data for the contacts resource
├── .env             # API key (not committed to git)
└── README.md        # This documentation
```
