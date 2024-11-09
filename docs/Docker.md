
# Docker Setup Documentation

## Overview

This document describes the Docker configuration for the Tüscher Systems website project, which consists of three main services:
- Frontend (Next.js)
- Backend (Strapi)
- Database (PostgreSQL)

## Project Structure

```plaintext
.
├── frontend/
│   ├── Dockerfile        # Production build
│   └── Dockerfile.dev    # Development setup
├── backend/
│   └── Dockerfile
├── docker-compose.yml
└── .env                  # Environment variables
```

## Docker Compose Configuration

### Services Overview

1. **PostgreSQL Database**
   - Uses official postgres:15 image
   - Persistent data storage using named volume
   - Health checks for database availability
   - Isolated in app-network

2. **Strapi Backend**
   - Custom build using Node.js Alpine
   - Development mode with hot-reloading
   - Volume mounts for live code updates
   - Health checks for service availability
   - Environment variables for database connection

3. **Next.js Frontend**
   - Development and production configurations
   - Volume mounts for development
   - Environment variables for Strapi connection
   - Depends on Strapi service

### Volume Mounts

The project uses three types of volumes:

1. **Named Volumes**
   ```yaml
   volumes:
     postgres-data:        # Persistent database storage
     frontend_node_modules: # Isolated node_modules
   ```

2. **Bind Mounts (Development)**
   ```yaml
   volumes:
     - ./frontend:/app    # Live code updates
     - ./backend:/srv/app # Live backend updates
   ```

3. **Anonymous Volumes**
   ```yaml
   volumes:
     - /srv/app/node_modules # Prevents local override
   ```

### Networking

- All services are connected through `app-network`
- Internal service discovery (e.g., Strapi at `http://strapi:1337`)
- Port mappings for local development:
  - Frontend: 3000
  - Backend: 1337
  - Database: 5432 (internal only)

## Dockerfile Configurations

### Frontend Production (Dockerfile)

Key aspects:
- Base image: node:18-alpine
- Multi-stage build process
- Production optimizations
- Environment variable handling
- Dependencies installation with legacy peer deps
- Production build step

### Frontend Development (Dockerfile.dev)

Differences from production:
- No build step
- Development environment
- Volume mounting support
- Hot-reload enabled
- Development dependencies included

### Backend (Dockerfile)

Features:
- Node.js Alpine base
- Development mode configuration
- Build step for Strapi
- wget for health checks
- Volume mounting support

## Development Workflow

1. **Starting the Environment**
   ```bash
   docker compose up
   ```

2. **Rebuilding Services**
   ```bash
   docker compose build --no-cache <service>
   ```

3. **Accessing Logs**
   ```bash
   docker compose logs -f <service>
   ```

4. **Installing New Dependencies**
   ```bash
   docker compose exec frontend npm install <package>
   ```

## Production Deployment

For production:
1. Use `Dockerfile` instead of `Dockerfile.dev`
2. Remove development volumes
3. Set `NODE_ENV=production`
4. Enable build optimization
5. Configure proper environment variables

## Best Practices

1. **Security**
   - Use environment variables for secrets
   - Never commit .env files
   - Use non-root users in containers

2. **Performance**
   - Utilize build caching
   - Optimize layer ordering
   - Minimize image sizes

3. **Development**
   - Use volume mounts for hot-reloading
   - Separate dev and prod configurations
   - Maintain consistent versions

## Troubleshooting

Common issues and solutions:
1. **Permission Issues**
   - Check volume ownership
   - Verify user permissions

2. **Network Issues**
   - Verify service health checks
   - Check internal DNS resolution

3. **Build Issues**
   - Clear Docker cache
   - Verify dependency versions
   - Check build logs

## References

For more details about specific configurations, see:
- Docker Compose file reference
- Next.js Docker deployment
- Strapi Docker deployment
- PostgreSQL Docker deployment
