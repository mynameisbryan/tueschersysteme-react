# Quick commands

```bash
docker compose logs -f strapi 
docker compose logs frontend                 
```

```bash
docker compose down           
docker compose up -d --build
```




# Tüscher Systeme Website

## Project Overview
A modern web application for Tüscher Systeme, built with Next.js (frontend) and Strapi (backend) in a monorepo structure. The project uses Docker for containerization and PostgreSQL for data persistence.

## Directory Structure
```
project-root/
├── frontend/ (Next.js application)
│   ├── src/
│   │   ├── components/
│   │   ├── styles/
│   │   └── utils/
│   ├── Dockerfile
│   └── next.config.mjs
├── backend/ (Strapi CMS)
│   ├── src/
│   │   ├── api/
│   │   ├── admin/
│   │   └── extensions/
│   ├── config/
│   └── Dockerfile
├── docker-compose.yml
└── .env
```

## Tech Stack

### Frontend
- **Framework**: Next.js with TypeScript
- **Styling**: Tailwind CSS with custom components
- **Key Features**:
  - Server-Side Rendering (SSR)
  - Responsive design
  - Custom component library
  - Image optimization
  - API integration with Strapi

Reference to Tailwind configuration:

```1:40:website-neu/tailwind.config.ts
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        tuscher: {
          blue: {
            DEFAULT: "#012970",
            light: "#1a3d7e",
            dark: "#021b47",
            hover: "#003062"
          },
          gray: "#f9f9f9",
          footer: "#09203B",
          text: "#111111"
        }
      },
      fontFamily: {
        sans: ["var(--font-roboto)", "Arial", "sans-serif"],
        lato: ["var(--font-lato)", "sans-serif"]
      },
      height: {
        'screen-90': '90vh',
        'header': '80px'
      },
      maxHeight: {
        'logo': '55px'
      }
    },
  },
  plugins: [],
};

export default config;
```


### Backend
- **CMS**: Strapi v5.2.0
- **Database**: PostgreSQL
- **Features**:
  - Content Type Builder
  - User authentication
  - API token management
  - Custom controllers and services

## Development Setup

1. **Environment Variables**
Create a `.env` file with the following variables:
```bash
DATABASE_NAME=strapi
DATABASE_USERNAME=strapi
DATABASE_PASSWORD=strapi
NODE_ENV=development
NEXT_PUBLIC_STRAPI_API_URL=http://localhost:1337
STRAPI_API_TOKEN=your_token_here
```

2. **Docker Setup**
Start the development environment:
```bash
docker-compose up
```

The following services will be available:
- Frontend: http://localhost:3000
- Backend: http://localhost:1337
- PostgreSQL: port 5432

## API Integration
The frontend communicates with Strapi using custom API utilities:

Example Hero Section API integration:

```24:32:website-neu/src/components/home/HeroSection.tsx
async function getHeroContent() {
  try {
    const { data } = await fetchAPI<{ data: HeroSectionData }>('/api/hero-section');
    return data;
  } catch (error) {
    console.error('Error fetching hero content:', error);
    return null;
  }
}
```


## Component Structure
The project uses a modular component structure. Key components include:

1. **Hero Section**

```34:113:website-neu/src/components/home/HeroSection.tsx
export default async function HeroSection() {
  const heroContent = await getHeroContent();

  if (!heroContent) {
    console.error('Invalid hero content:', heroContent);
    return null;
  }

  const { Title, Description, CallToActionText, CallToActionLink, BackgroundImage } = heroContent;
  const backgroundImageUrl = BackgroundImage?.[0]?.url;

  return (
    <section className="relative h-[50vh] mt-24 overflow-hidden">
      {backgroundImageUrl && (
        <div className="absolute inset-0 w-full">
          <div className="relative w-full h-full">
            <Image
              src={getStrapiMediaUrl(backgroundImageUrl)}
              alt={BackgroundImage[0].alternativeText || Title}
              fill
              className="object-cover brightness-50"
              priority
              sizes="100vw"
            />
          </div>
        </div>
      )}
      
      {/* Content Container */}
      <div className="relative container mx-auto px-4 h-full max-w-6xl">
        <div className="flex flex-col md:flex-row items-center justify-center h-full gap-8 py-12">
          {/* Left Side */}
          <div className="w-full md:w-1/2 space-y-6 z-10">
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-white leading-tight">
              {Title}
            </h1>
            <p className="text-lg md:text-xl text-gray-200">
              {Description}
            </p>
            <div className="flex flex-col sm:flex-row gap-4">
              <Link
                href={CallToActionLink}
                className="inline-flex items-center justify-center px-8 py-3 bg-white 
                         text-tuscher-blue hover:bg-gray-100 rounded-full transition-colors"
              >
                {CallToActionText}
              </Link>
              <Link
                href="/contact"
                className="inline-flex items-center justify-center px-8 py-3 
                         border-2 border-white text-white hover:bg-white 
                         hover:text-tuscher-blue rounded-full transition-colors"
              >
                Kontakt
              </Link>
            </div>
          </div>
          
          {/* Right Side */}
          <div className="w-full md:w-1/2 p-4 z-10">
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6 shadow-lg">
              <h2 className="text-2xl font-semibold mb-8 text-white">Warum Tüscher Systeme?</h2>
              <ul className="space-y-6">
                <li className="flex items-center gap-4">
                  <span className="flex-shrink-0 w-12 h-12 flex items-center justify-center 
                                 rounded-full bg-yellow-400/20">
                    <svg className="w-6 h-6 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                    </svg>
                  </span>
                  <span className="text-lg text-white">Innovative Lösungen</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
```


2. **Welcome Section**

```14:45:website-neu/src/components/home/WelcomeSection.tsx
export default async function WelcomeSection() {
  try {
    const welcomeContent = await getWelcomeContent();
    
    return (
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-4">
            {welcomeContent.Title}
          </h2>
          <div className="h-1 w-24 bg-tuscher-blue mx-auto mb-12"></div>
          <div className="max-w-3xl mx-auto text-center space-y-6">
            {welcomeContent.Paragraphs.split('\n').map((paragraph, index) => (
              <p key={index} className="text-lg text-gray-700">
                {paragraph}
              </p>
            ))}
          </div>
        </div>
      </section>
    );
  } catch (error) {
    return (
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-4">Welcome</h2>
          <p className="text-center text-red-600">Failed to load welcome content.</p>
        </div>
      </section>
    );
  }
}
```


## Styling
Global styles are managed through Tailwind CSS with custom utilities:

```1:90:website-neu/src/styles/globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: #ffffff;
    --foreground: #171717;
  }

  @media (prefers-color-scheme: dark) {
    :root {
      --background: #ffffff;
      --foreground: #ededed;
    }
  }

  body {
    @apply bg-background text-tuscher-text font-sans antialiased;
  }
}

@layer components {
  /* Layout Components */
  .container {
    @apply max-w-7xl mx-auto px-4;
  }

  .container-padding {
    @apply px-4 mx-auto max-w-7xl;
  }

  /* Button Components */
  .btn {
    @apply inline-flex items-center justify-center px-6 py-3 rounded transition-colors duration-300;
  }

  .btn-primary {
    @apply btn bg-tuscher-blue text-white hover:bg-tuscher-blue-light;
  }

  /* Navigation Components */
  .nav-link {
    @apply text-tuscher-blue px-3 py-2 rounded transition-colors duration-300
    hover:bg-tuscher-blue hover:text-white;
  }

  .nav-link.active {
    @apply font-bold;
  }

  /* Section Components */
  .section {
    @apply py-16;
  }

  .section-title {
    @apply text-2xl md:text-3xl font-bold text-tuscher-blue text-center mb-8
    after:content-[''] after:block after:w-[155px] after:h-[1px] 
    after:bg-tuscher-blue-light after:mx-auto after:mt-2;
  }

  /* Card Components */
  .card {
    @apply bg-white rounded-lg shadow-md overflow-hidden transition-transform duration-300;
  }

  .card-hover {
    @apply hover:shadow-lg hover:scale-105;
  }

  /* Hero Components */
  .hero-section {
    @apply relative h-[50vh] mt-24;
  }

  .hero-content {
    @apply absolute inset-0 flex items-center;
  }

  .hero-text {
    @apply max-w-2xl text-white space-y-6;
  }
}

@layer utilities {
  .text-balance {
    text-wrap: balance;
  }
}
```


## Database Configuration
PostgreSQL is configured through Strapi:

```1:33:backend/config/database.ts
import path from 'path';

export default ({ env }) => {
  const client = env('DATABASE_CLIENT', 'postgres');

  const connections = {
    postgres: {
      connection: {
        host: env('DATABASE_HOST'),
        port: env.int('DATABASE_PORT'),
        database: env('DATABASE_NAME'),
        user: env('DATABASE_USERNAME'),
        password: env('DATABASE_PASSWORD'),
        ssl: env.bool('DATABASE_SSL', false) ? {
          rejectUnauthorized: env.bool('DATABASE_SSL_REJECT_UNAUTHORIZED', true),
        } : false,
        schema: env('DATABASE_SCHEMA', 'public'),
      },
      pool: {
        min: env.int('DATABASE_POOL_MIN', 2),
        max: env.int('DATABASE_POOL_MAX', 10),
      },
    },
  };

  return {
    connection: {
      client,
      ...connections[client],
      acquireConnectionTimeout: env.int('DATABASE_CONNECTION_TIMEOUT', 60000),
    },
  };
};
```


## Development Commands

### Frontend
```bash
cd frontend
npm run dev    # Development server
npm run build  # Production build
npm run start  # Start production server
```

### Backend
```bash
cd backend
npm run develop  # Start development server
npm run build   # Build admin panel
npm run start   # Start production server
```

## Docker Configuration
The project includes separate Dockerfiles for frontend and backend:

Frontend Dockerfile:

```1:17:website-neu/Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
RUN npm install sharp
COPY . .

ARG NEXT_PUBLIC_STRAPI_API_URL
ARG STRAPI_API_TOKEN
ENV NEXT_PUBLIC_STRAPI_API_URL=${NEXT_PUBLIC_STRAPI_API_URL}
ENV STRAPI_API_TOKEN=${STRAPI_API_TOKEN}

RUN npm run build

EXPOSE 3000
CMD ["npm", "run", "start"]

```


Backend Dockerfile:

```1:10:backend/Dockerfile
FROM node:18-alpine
WORKDIR /srv/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "develop"]

```


## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License
Private - All rights reserved

For detailed documentation about specific components or setup instructions, please refer to the respective README files in the frontend and backend directories.