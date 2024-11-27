export const getStrapiUrl = (path: string = '') => {
  const isDevelopment = process.env.NODE_ENV === 'development';
  const baseUrl = isDevelopment 
    ? 'http://localhost:1337'
    : process.env.NEXT_PUBLIC_STRAPI_API_URL;

  if (!baseUrl && !isDevelopment) {
    console.warn('[Strapi] No API URL configured in production');
  }

  return `${baseUrl || 'http://localhost:1337'}${path}`;
}; 