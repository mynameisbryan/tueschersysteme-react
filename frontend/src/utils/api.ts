import { StrapiError, StrapiResponse } from '@/types/strapi';
import { ProductCategoryData, FAQData, ContactSectionData } from '@/types/content';
import qs from 'qs';

const getApiUrl = () => {
  console.log('NODE_ENV:', process.env.NODE_ENV);
  console.log('STRAPI_INTERNAL_URL:', process.env.STRAPI_INTERNAL_URL);
  console.log('NEXT_PUBLIC_STRAPI_API_URL:', process.env.NEXT_PUBLIC_STRAPI_API_URL);
  console.log('isServer:', typeof window === 'undefined');

  // Server-side requests (both dev and prod)
  if (typeof window === 'undefined') {
    return process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337';
  }
  
  // Client-side requests (both dev and prod)
  return process.env.NEXT_PUBLIC_STRAPI_API_URL || 'http://localhost:1337';
};

const getApiToken = () => {
  if (typeof window === 'undefined') {
    // Server-side
    return process.env.STRAPI_API_TOKEN;
  }
  // Client-side
  return process.env.NEXT_PUBLIC_STRAPI_TOKEN;
};

export async function fetchAPI<T>(
  endpoint: string,
  query?: Record<string, any>
): Promise<T> {
  const apiUrl = getApiUrl();
  const token = getApiToken();  // Get token dynamically

  if (!apiUrl) {
    throw new Error('Strapi API URL is not defined');
  }

  const queryString = query ? `?${qs.stringify(query)}` : '';
  const url = `${apiUrl}${endpoint}${queryString}`;

  const headers: HeadersInit = {
    'Content-Type': 'application/json',
  };

  if (token) {
    headers.Authorization = `Bearer ${token}`;
    console.log('Using token:', token.substring(0, 10) + '...');  // Debug log
  } else {
    console.warn('No API token found');  // Debug log
  }

  console.log('Fetching URL:', url);
  console.log('Headers:', headers);  // Debug log

  try {
    const response = await fetch(url, {
      headers,
      cache: 'no-store',
    });

    if (!response.ok) {
      console.error('API Error:', response.status, response.statusText);  // Debug log
      const errorData = await response.json();
      throw new Error(
        errorData.error?.message || `HTTP error! status: ${response.status}`
      );
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('API fetch error:', error);
    throw error;  // Let the error propagate instead of returning empty data
  }
}

export function getStrapiMediaUrl(url: string): string {
  if (!url) return '';
  
  if (url.startsWith('http')) {
    return url;
  }
  
  // Always use localhost in development
  if (process.env.NODE_ENV === 'development') {
    return `http://localhost:1337${url}`;
  }
  
  const baseUrl = typeof window === 'undefined' 
    ? process.env.STRAPI_INTERNAL_URL 
    : process.env.NEXT_PUBLIC_STRAPI_API_URL;
    
  return `${baseUrl}${url}`;
}

export async function getProductCategories(page = 1, pageSize = 9) {
  return await fetchAPI<ProductCategoryData[]>('/api/product-categories', {
    pagination: { page, pageSize },
  });
}

export async function getFAQs() {
  return await fetchAPI<StrapiResponse<FAQData[]>>('/api/faqs');
}

export function sendContactForm(formData: {
  name: string;
  email: string;
  phone: string;
  message: string;
  privacy: boolean;
  newsletter: boolean;
}) {
  const response = fetchAPI('/api/contact-forms', {
    method: 'POST',
    body: JSON.stringify({ data: formData }),
  });
  return response;
}

export async function getContactData() {
  const query = {
    populate: {
      address: {
        populate: '*'
      },
      contact_form: {
        populate: '*'
      }
    }
  };
  return fetchAPI<StrapiResponse<ContactSectionData>>('/api/contactsection', query);
}

function checkEnvironmentVariables() {
  const required = ['STRAPI_INTERNAL_URL', 'STRAPI_API_TOKEN'];
  const missing = required.filter(key => !process.env[key]);
  
  if (missing.length > 0) {
    console.error('Missing required environment variables:', missing);
    return false;
  }
  return true;
}

