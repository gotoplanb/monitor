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
- Dev: `npm run dev` - Start dev server
- Build: `npm run build` - Build for production
- Lint: `npm run lint` - Run ESLint

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