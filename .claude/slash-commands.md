# Custom Slash Commands for Monitors Project

This file defines custom slash commands that Claude can recognize when working with the Monitors project.

## Available Commands

### `/monitor-help`
Displays available project-specific commands and their descriptions.

### `/monitor-status`
Shows the current status of all repositories in the Monitors project.

### `/monitor-workflow [workflow-name]`
Displays information about common cross-repository workflows.
- Example: `/monitor-workflow new-endpoint`
- Available workflows: new-endpoint, new-monitor-type, infrastructure-change

### `/monitor-api-docs`
Shows documentation links and key information about the monitors-api.

### `/monitor-client-docs`
Shows documentation links and key information about the monitors-client-nextjs.

### `/monitor-infra-docs`
Shows documentation links and key information about the monitors-terraform.

### `/monitor-test-docs`
Shows documentation links and key information about the pester testing utilities.

### `/monitor-commands [repo-name]`
Lists available commands for a specific repository.
- Example: `/monitor-commands monitors-api`

## Implementation Details

When a user types one of these commands, Claude should:

1. Recognize the command and its parameters
2. Lookup the relevant information from the project documentation
3. Provide a helpful response based on the command context
4. Include links to relevant documentation files when appropriate

## Example Responses

### `/monitor-help`
```
Available Monitors Project Commands:
- /monitor-status: Show status of all repositories
- /monitor-workflow [workflow-name]: Show workflow information
- /monitor-api-docs: Show API documentation
- /monitor-client-docs: Show client documentation
- /monitor-infra-docs: Show infrastructure documentation
- /monitor-test-docs: Show testing documentation
- /monitor-commands [repo-name]: List commands for a specific repository
```

### `/monitor-status`
```
Current Monitors Project Status:
- monitors-api: Running FastAPI backend (v1.2.3)
- monitors-client-nextjs: Next.js frontend (v2.0.1)
- monitors-terraform: Infrastructure (v1.1.0)
- pester: Testing utilities (v0.9.5)
```

### `/monitor-workflow new-endpoint`
```
Workflow: Adding a New API Endpoint

Steps:
1. Create endpoint in monitors-api
   - Add route in appropriate router file
   - Implement endpoint logic
   - Add authentication if required
   - Update documentation

2. Update frontend in monitors-client-nextjs
   - Add API client method in src/utils/api.ts
   - Create or update components to use the new endpoint
   - Add error handling

3. Add tests
   - Add unit tests in monitors-api
   - Add test cases in pester
   - Add frontend tests in monitors-client-nextjs

For more details, see monitors/README.md
```