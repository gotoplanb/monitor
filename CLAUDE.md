# Claude Guidelines for Monitor Project

## Project Structure and Relationships

This project consists of several interrelated repositories that work together as a monitoring system. Understanding the relationships between these repositories is essential for making effective changes.

### Repository Relationships

- **monitor-api** (FastAPI backend)
  - Core functionality for monitor data handling
  - Consumed by: monitor-client-nextjs
  - Tested by: pester
  - Deployed by: monitor-terraform

- **monitor-client-nextjs** (Frontend)
  - UI for interacting with monitor-api
  - Depends on: monitor-api
  - Deployed by: monitor-terraform (Vercel configuration)

- **monitor-terraform** (Infrastructure)
  - Manages cloud resources for all components
  - Deploys: monitor-api, monitor-client-nextjs
  - Configures: AWS, Cloudflare, Sumo Logic, Vercel

- **pester** (Testing utilities)
  - Sends curl requests to validate API functionality
  - Tests: monitor-api endpoints

## Key Files and Their Purpose

### monitor-api
- `app/models/monitor.py`: Core data model for monitors
- `app/schemas/monitor.py`: Pydantic schemas for API data validation
- `app/api/dependencies.py`: API dependency injection
- `app/core/config.py`: Application configuration
- `app/database.py`: Database connection handling
- `app/main.py`: FastAPI application entry point

### monitor-client-nextjs
- `src/utils/api.ts`: API client for communication with backend
- `src/components/MonitorCard.tsx`: UI component for displaying monitors
- `src/app/page.tsx`: Main application page
- `__tests__/`: Unit and component tests

### monitor-terraform
- `cloudflare.tf`: Cloudflare configuration
- `lambda.tf`: AWS Lambda configuration
- `vercel.tf`: Vercel deployment configuration
- `variables.tf`: Configuration variables
- `outputs.tf`: Output values from infrastructure

### pester
- `curl_scripts/update_monitor_state.sh`: Scripts for testing API endpoints
- `run_all_scripts.sh`: Orchestrates test execution

## Common Cross-Repository Workflows

1. **Adding a new monitor type**:
   - Update `monitor-api/app/models/monitor.py` with new model fields
   - Update `monitor-api/app/schemas/monitor.py` with new schema fields
   - Add new API endpoints in monitor-api
   - Update frontend components in monitor-client-nextjs
   - Add test cases in pester

2. **Changing infrastructure**:
   - Update relevant files in monitor-terraform
   - Test with pester to ensure API accessibility
   - Verify frontend functionality after deployment

3. **Adding a new API endpoint**:
   - Create endpoint in monitor-api
   - Update frontend to use the new endpoint
   - Add tests in pester to validate functionality

## Build/Test/Deploy Commands

### monitor-api (FastAPI)
- Setup: `make setup` - Create venv and install dependencies
- Run: `make run` - Start FastAPI server
- Lint: `make lint` - Run pylint
- Format: `make format` - Run black
- Test: `make test` - Run all tests

### monitor-client-nextjs
- Dev: `npm run dev` or `make run` - Start dev server
- Build: `npm run build` or `make build` - Build for production
- Lint: `npm run lint` or `make lint` - Run ESLint
- Test: `npm run test` or `make test` - Run unit tests
- Test E2E: `npm run test:e2e` or `make test-e2e` - Run Playwright tests

### Top-level Project Commands
- `make commit MESSAGE="Your commit message"` - Add and commit changes in all repos
- `make tag TAG="v1.0.0"` - Tag all repos with the same tag
- `make status` - Show git status for all repos
- `make pull` - Pull latest changes for all repos
- `make push` - Push commits to remote for all repos

## Code Style and Guidelines

### Python (monitor-api)
- Black for formatting, Pylint for linting
- Type annotations for function parameters and returns
- Classes: PascalCase, functions/variables: snake_case, constants: UPPERCASE

### JavaScript/TypeScript (monitor-client-nextjs)
- ESLint with Next.js core-web-vitals config
- Use TypeScript types where possible
- Use React hooks for state management
- Follow Next.js file-based routing conventions

## Testing Guidelines

### API Testing
- Unit tests for API endpoints
- Test success and error cases
- Validate data models and schemas

### Frontend Testing
- Unit tests with Jest and React Testing Library
- E2E tests with Playwright
- Test critical user flows

## Common Error Handling Patterns
- API: Return appropriate HTTP status codes with error messages
- Client: Use try/catch blocks with error state handling
- Infrastructure: Proper logging and monitoring setup