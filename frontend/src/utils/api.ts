import { StrapiError, StrapiMediaData, StrapiResponse } from '@/types/strapi';
import { ProductCategoryData, FAQData, ContactSectionData } from '@/types/content';
import { FileResourceData } from '@/types/common';
import qs from 'qs';
import { BaseProductCategory, HomeProductCategory } from '@/types/common';

// New unified URL handler for api.ts
const API_CONFIG = {
  getBaseUrl: () => {
    if (typeof window === 'undefined') {
      return process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337';
    }
    return process.env.NEXT_PUBLIC_STRAPI_API_URL || 'http://localhost:1337';
  },
  
  getMediaUrl: (path: string) => {
    if (!path) return '';
    if (path.startsWith('http')) return path;
    return `${process.env.NEXT_PUBLIC_STRAPI_URL || 'http://strapi:1337'}${path}`;
  }
};

const getToken = async () => {
  const token = typeof window === 'undefined' 
    ? process.env.STRAPI_API_TOKEN 
    : process.env.NEXT_PUBLIC_STRAPI_TOKEN;
    
  if (!token) {
    console.warn('[API] No API token found');
    throw new Error('API token is not configured');
  }
  
  return token;
};

export async function fetchAPI<T>(
  endpoint: string,
  options: Record<string, any> = {}
): Promise<T> {
  const baseUrl = API_CONFIG.getBaseUrl();
  const token = await getToken();
  
  const queryString = options ? `?${qs.stringify(options)}` : '';
  const url = `${baseUrl}${endpoint}${queryString}`;

  console.log('[API] Request details:', {
    endpoint,
    baseUrl,
    hasToken: !!token,
    tokenPrefix: token ? token.substring(0, 10) + '...' : null,
    queryParams: queryString,
    timestamp: new Date().toISOString()
  });

  try {
    const response = await fetch(url, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${token}`
      },
      cache: 'no-store'
    });

    console.log('[API] Response status:', {
      endpoint,
      status: response.status,
      ok: response.ok,
      statusText: response.statusText
    });

    if (!response.ok) {
      const errorText = await response.text();
      console.error('[API] Response error:', {
        status: response.status,
        statusText: response.statusText,
        body: errorText,
        url: url.replace(token, '***')
      });
      throw new Error(`API request failed: ${response.status} ${response.statusText}`);
    }

    const data = await response.json();
    return data as T;
  } catch (error) {
    console.error('[API] Fetch error:', {
      endpoint,
      error: error instanceof Error ? {
        name: error.name,
        message: error.message,
        stack: error.stack
      } : String(error),
      url: url.replace(token, '***')
    });
    throw error;
  }
}

interface ProductCategoriesParams {
  pagination?: {
    page?: number;
    pageSize?: number;
  };
  populate?: {
    Image: {
      fields: ['url', 'alternativeText', 'width', 'height', 'formats']
    };
    products: {
      populate: {
        MainImage: {
          fields: ['url', 'alternativeText', 'width', 'height', 'formats']
        }
      }
    };
  };
}

export const getProductCategories = async (
  query?: ProductCategoriesParams
): Promise<StrapiResponse<BaseProductCategory[]>> => {
  try {
    const response = await fetchAPI<StrapiResponse<any>>('/api/product-categories', query);
    
    if (!response?.data) {
      throw new Error('Invalid API response structure');
    }

    console.log('[API] Product categories raw response:', {
      count: response.data.length,
      firstItem: response.data[0] ? {
        id: response.data[0].id,
        title: response.data[0].Title
      } : null
    });

    const transformedData: StrapiResponse<BaseProductCategory[]> = {
      data: response.data.map((item: any) => ({
        id: item.id,
        documentId: item.documentId || '',
        Title: item.Title || '',
        Description: item.Description || '',
        slug: item.slug || '',
        Image: Array.isArray(item.Image) ? item.Image : [],
        products: [],  // We'll handle products in a separate query
        createdAt: item.createdAt || '',
        updatedAt: item.updatedAt || '',
        publishedAt: item.publishedAt || ''
      })),
      meta: response.meta
    };

    return transformedData;
  } catch (error) {
    console.error('[API] getProductCategories error:', error);
    throw error;
  }
};

export const getHomeProductCategories = async (page = 1, pageSize = 9): Promise<StrapiResponse<HomeProductCategory[]>> => {
  const query = {
    pagination: { page, pageSize },
    populate: {
      Image: { populate: '*' }
    }
  };
  return await fetchAPI('/api/product-categories', query);
};

export const getFAQs = async (): Promise<StrapiResponse<FAQData[]>> => {
  return await fetchAPI('/api/faqs', { populate: '*' });
};

export const getContactData = async (): Promise<StrapiResponse<ContactSectionData>> => {
  return await fetchAPI('/api/contactsection', { populate: '*' });
};

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

export const getFileResources = async (): Promise<StrapiResponse<FileResourceData[]>> => {
  return await fetchAPI('/api/file-and-resources', { populate: '*' });
};

export const getImageUrl = API_CONFIG.getMediaUrl;

