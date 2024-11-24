export const getStrapiUrl = () => {
  const isDevelopment = process.env.NODE_ENV === 'development';
  return isDevelopment 
    ? 'http://localhost:1337'
    : process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337';
}; 