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
  const apiUrl = API_CONFIG.getBaseUrl();
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
      const errorData = await response.json();
      console.error('API Error:', {
        status: response.status,
        statusText: response.statusText,
        errorData
      });
      throw new Error(
        errorData.error?.message || `HTTP error! status: ${response.status}`
      );
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error('API fetch error:', {
      endpoint,
      error,
      query
    });
    throw error;
  }
}

interface ProductCategoriesParams {
  pagination?: {
    page?: number;
    pageSize?: number;
  };
  populate?: string | {
    Image?: any;
    products?: any;
  };
  query?: string;
}

export const getProductCategories = async (params?: ProductCategoriesParams): Promise<StrapiResponse<BaseProductCategory[]>> => {
  try {
    const response = await fetchAPI<StrapiResponse<BaseProductCategory[]>>('/api/product-categories', {
      ...params
    });

    if (!response?.data) {
      throw new Error('No data received from API');
    }

    const transformedData: StrapiResponse<BaseProductCategory[]> = {
      data: response.data.map(item => ({
        id: item.id,
        attributes: {
          documentId: (item as any).documentId,
          Title: (item as any).Title,
          Description: (item as any).Description,
          slug: (item as any).slug,
          Image: {
            data: Array.isArray((item as any).Image) 
              ? (item as any).Image.map((img: any) => ({
                  id: img.id,
                  attributes: {
                    url: img.url,
                    alternativeText: img.alternativeText || '',
                    width: img.width,
                    height: img.height,
                    formats: img.formats || {}
                  }
                })) 
              : []
          },
          products: (item as any).products ? {
            data: ((item as any).products.data || []).map((product: any) => ({
              id: product.id,
              attributes: {
                Name: product.attributes.Name,
                ShortDescription: product.attributes.ShortDescription,
                DetailedDescription: product.attributes.DetailedDescription,
                Features: product.attributes.Features,
                MainImage: product.attributes.MainImage,
                GalleryImages: product.attributes.GalleryImages,
                createdAt: product.attributes.createdAt,
                updatedAt: product.attributes.updatedAt,
                publishedAt: product.attributes.publishedAt,
                CTALink: product.attributes.CTALink
              }
            }))
          } : { data: [] },
          createdAt: (item as any).createdAt,
          updatedAt: (item as any).updatedAt,
          publishedAt: (item as any).publishedAt
        }
      })),
      meta: response.meta
    };

    return transformedData;
  } catch (error) {
    console.error('Error fetching product categories:', error);
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

