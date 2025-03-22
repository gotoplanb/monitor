# Claude Guidelines for Monitors Project

## Project Structure and Relationships

This project consists of several interrelated repositories that work together as a monitoring system. Understanding the relationships between these repositories is essential for making effective changes.

### Repository Relationships

- **monitors-api** (FastAPI backend)
  - Core functionality for monitor data handling
  - Consumed by: monitors-client-nextjs
  - Tested by: pester
  - Deployed by: monitors-terraform

- **monitors-client-nextjs** (Frontend)
  - UI for interacting with monitors-api
  - Depends on: monitors-api
  - Deployed by: monitors-terraform (Vercel configuration)

- **monitors-terraform** (Infrastructure)
  - Manages cloud resources for all components
  - Deploys: monitors-api, monitors-client-nextjs
  - Configures: AWS, Cloudflare, Sumo Logic, Vercel

- **pester** (Testing utilities)
  - Sends curl requests to validate API functionality
  - Tests: monitors-api endpoints

## Key Files and Their Purpose

### monitors-api
- `app/models/monitor.py`: Core data model for monitors
- `app/schemas/monitor.py`: Pydantic schemas for API data validation
- `app/api/dependencies.py`: API dependency injection
- `app/core/config.py`: Application configuration
- `app/database.py`: Database connection handling
- `app/main.py`: FastAPI application entry point

### monitors-client-nextjs
- `src/utils/api.ts`: API client for communication with backend
- `src/components/MonitorCard.tsx`: UI component for displaying monitors
- `src/app/page.tsx`: Main application page
- `__tests__/`: Unit and component tests

### monitors-terraform
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
   - Update `monitors-api/app/models/monitor.py` with new model fields
   - Update `monitors-api/app/schemas/monitor.py` with new schema fields
   - Add new API endpoints in monitors-api
   - Update frontend components in monitors-client-nextjs
   - Add test cases in pester

2. **Changing infrastructure**:
   - Update relevant files in monitors-terraform
   - Test with pester to ensure API accessibility
   - Verify frontend functionality after deployment

3. **Adding a new API endpoint**:
   - Create endpoint in monitors-api
   - Update frontend to use the new endpoint
   - Add tests in pester to validate functionality

## Build/Test/Deploy Commands

### monitors-api (FastAPI)
- Setup: `make setup` - Create venv and install dependencies
- Run: `make run` - Start FastAPI server
- Lint: `make lint` - Run pylint
- Format: `make format` - Run black
- Test: `make test` - Run all tests

### monitors-client-nextjs
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

### Python (monitors-api)
- Black for formatting, Pylint for linting
- Type annotations for function parameters and returns
- Classes: PascalCase, functions/variables: snake_case, constants: UPPERCASE

### JavaScript/TypeScript (monitors-client-nextjs)
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