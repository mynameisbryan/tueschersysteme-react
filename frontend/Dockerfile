FROM node:18-alpine
WORKDIR /app

# Add ARG statements near the top
ARG STRAPI_API_TOKEN
ARG NEXT_PUBLIC_STRAPI_API_URL
ARG NEXT_PUBLIC_STRAPI_TOKEN

# Copy package files
COPY package*.json ./

# Install dependencies with legacy peer deps to avoid conflicts
RUN npm install --legacy-peer-deps

# Install sharp for image optimization
RUN npm install sharp

# Install ESLint plugins with specific versions that match Next.js requirements
RUN npm install --save-dev --legacy-peer-deps \
    @typescript-eslint/eslint-plugin@6.21.0 \
    @typescript-eslint/parser@6.21.0

# Copy the rest of the application
COPY . .

# Set environment variables
ENV NEXT_TELEMETRY_DISABLED=1
ENV NODE_ENV=production
ENV NEXT_PUBLIC_STRAPI_API_URL=${NEXT_PUBLIC_STRAPI_API_URL}
ENV STRAPI_INTERNAL_URL=http://strapi:1337
ENV STRAPI_API_TOKEN=${STRAPI_API_TOKEN}
ENV NEXT_PUBLIC_STRAPI_TOKEN=${STRAPI_API_TOKEN}

# Build the application
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
