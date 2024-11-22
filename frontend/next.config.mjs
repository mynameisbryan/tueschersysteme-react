// next.config.mjs

/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: [
      'localhost',
      'strapi',
      process.env.NEXT_PUBLIC_IMAGE_DOMAIN, // Use the environment variable
    ].filter(Boolean), // Remove any undefined values
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1337',
        pathname: '/uploads/**',
      },
      {
        protocol: 'http',
        hostname: 'strapi',
        port: '1337',
        pathname: '/uploads/**',
      },
      {
        protocol: 'http',
        hostname: process.env.NEXT_PUBLIC_IMAGE_DOMAIN, // Use the environment variable
        port: '1337',
        pathname: '/uploads/**',
      },
    ].filter(pattern => pattern.hostname), // Remove patterns with undefined hostname
  },
  env: {
    NEXT_PUBLIC_STRAPI_API_URL: process.env.NEXT_PUBLIC_STRAPI_API_URL,
    NEXT_PUBLIC_STRAPI_URL: process.env.NEXT_PUBLIC_STRAPI_URL,
    NEXT_PUBLIC_IMAGE_DOMAIN: process.env.NEXT_PUBLIC_IMAGE_DOMAIN, // Add this
    STRAPI_API_TOKEN: process.env.STRAPI_API_TOKEN,
    STRAPI_INTERNAL_URL: process.env.STRAPI_INTERNAL_URL,
  },
  experimental: {
    workerThreads: false,
    cpus: 1,
  },
};

export default nextConfig;
