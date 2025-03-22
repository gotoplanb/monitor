# Monitors Project

## Overview

This project consists of several interconnected repositories that collectively form a monitoring system for web applications and services.

## Repositories

### monitors-api 

The main backend service that provides the core API functionality for the monitoring system. This service provides endpoints for:
- Creating and managing monitors
- Retrieving monitor status
- Configuring alerts
- Managing users and permissions

**Tech Stack**: Python, FastAPI, SQLAlchemy, Alembic, PostgreSQL

([repo](https://github.com/gotoplanb/monitors-api))

### monitors-client-nextjs

A Next.js frontend application that provides a user interface for interacting with the monitors-api. Features include:
- Dashboard for viewing monitor status
- Configuration interface for monitors
- Alert management
- User authentication and authorization

**Tech Stack**: TypeScript, Next.js, React, Tailwind CSS, Jest for testing

([repo](https://github.com/gotoplanb/monitors-client-nextjs))

### monitors-terraform

Infrastructure as code for deploying all components of the monitoring system. This repository includes:
- Cloud provider configuration (AWS, Cloudflare, Sumo Logic, Vercel)
- Database setup
- Network configuration
- CI/CD pipeline integration

**Tech Stack**: Terraform, AWS, Cloudflare

([repo](https://github.com/gotoplanb/monitors-terraform))

### pester

Testing and monitoring utilities that send curl requests to validate the functionality of the entire ecosystem. Includes:
- API testing scripts
- Load testing tools
- Monitoring validation tools

**Tech Stack**: Bash scripts, curl

([repo](https://github.com/gotoplanb/pester))

## Architecture

The system follows a standard client-server architecture:

1. **monitors-client-nextjs**: Provides the user interface
2. **monitors-api**: Provides the backend functionality
3. **monitors-terraform**: Manages infrastructure
4. **pester**: Validates and tests the system

## Data Flow

1. Users interact with the Next.js client
2. Client makes API calls to the FastAPI backend
3. Backend reads/writes to the database
4. Backend triggers alerts when monitoring thresholds are exceeded
5. Infrastructure is managed through Terraform
6. Pester sends curl requests to validate functionality

## Development Workflow

When making changes to the system:
1. Update the API in monitors-api
2. Update the client to interact with new API features
3. Update the infrastructure as needed
4. Run tests with pester to validate changes

## Common Cross-Cutting Concerns

- Authentication and authorization
- Error handling
- Logging
- Configuration management
- Deployment processes

## Contributing

When contributing to this project:
1. Follow the repository-specific guidelines in each repository
2. Consider cross-repository impacts
3. Update tests to validate changes
4. Document changes in the appropriate places