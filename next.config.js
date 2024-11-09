/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['localhost', 'strapi'],
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1337',
        pathname: '/**',
      },
      {
        protocol: 'http',
        hostname: 'strapi',
        port: '1337',
        pathname: '/**',
      },
    ],
  },
}

module.exports = nextConfig 