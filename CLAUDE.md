# CLAUDE.md - Monitor Codebase Guidelines

## Build/Lint/Test Commands

### monitors-api (FastAPI)
- Setup: `make setup` - Create venv and install deps
- Run: `make run` - Start FastAPI server
- Lint: `make lint` - Run pylint
- Format: `make format` - Run black
- Test: `make test` - Run all tests
- Single test: `python -m pytest tests/test_file.py::test_name -v`

### monitors-client-nextjs
- Dev: `npm run dev` or `make run` - Start dev server
- Build: `npm run build` or `make build` - Build for production
- Lint: `npm run lint` or `make lint` - Run ESLint
- Format: `make format` - Format code with Prettier
- Format Check: `make format-check` - Check formatting without modifying files
- Lint CI: `make lint-ci` - Run ESLint with zero tolerance for warnings
- Test: `npm run test` or `make test` - Run unit tests
- Test E2E: `npm run test:e2e` or `make test-e2e` - Run Playwright tests
- Test All: `npm run test:ci` or `make test-all` - Run all tests
- CI: `make ci` - Run all checks and tests for CI environments
- Clean: `make clean` - Remove build artifacts

## Code Style Guidelines

### Python (monitors-api)
- Use Black for formatting, Pylint for linting
- Type annotations for function parameters and returns
- Classes: PascalCase, functions/variables: snake_case, constants: UPPERCASE
- Import order: stdlib, third-party, local

### JavaScript/TypeScript (monitors-client-nextjs)
- ESLint with Next.js core-web-vitals config
- Use TypeScript types where possible
- Use React hooks for state management
- Follow Next.js file-based routing conventions

### Error Handling
- API: Return appropriate HTTP status codes with error messages
- Client: Use try/catch blocks with error state handling

## Testing Guidelines

### Unit Tests (monitors-client-nextjs)
- Use Jest and React Testing Library
- Test component rendering and interactions
- Mock API calls using MSW or jest.mock
- Test each component in isolation
- Follow AAA pattern (Arrange, Act, Assert)

### E2E Tests (Playwright)
- Test complete user flows
- Validate critical paths: monitor list → detail → pagination
- Use page object model pattern
- Test both success and error states