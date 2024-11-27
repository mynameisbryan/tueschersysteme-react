import { StrapiError, StrapiMediaData, StrapiResponse } from '@/types/strapi';
import { ProductCategoryData, FAQData, ContactSectionData, WelcomeSectionData, ImpressumData } from '@/types/content';
import { FileResourceData } from '@/types/common';
import qs from 'qs';
import { BaseProductCategory, HomeProductCategory, Product, StrapiCollectionResponse } from '@/types/common';
import { SalesFunnelFormData, SalesFunnelInquiry, SalesFunnelResponse } from '@/types/sales-funnel';

// Replace existing API_CONFIG with new URL handler
const getStrapiUrl = (path: string = '') => {
  const baseUrl = process.env.NEXT_PUBLIC_STRAPI_API_URL || 'http://localhost:1337';
  return `${baseUrl}${path}`;
};

// Update getToken function
const getToken = async () => {
  const token = process.env.STRAPI_API_TOKEN;

  if (!token) {
    console.warn('[API] No API token found for', process.env.NODE_ENV, 'environment');
    throw new Error('API token is not configured');
  }
  return token;
};

// Update fetchAPI function to include encodeValuesOnly
export async function fetchAPI<T>(
  endpoint: string,
  options: Record<string, any> = {}
): Promise<T> {
  const requestUrl = getStrapiUrl(endpoint);
  const token = await getToken();
  
  const queryString = options ? `?${qs.stringify(options, { encodeValuesOnly: true })}` : '';
  const url = `${requestUrl}${queryString}`;

  console.log('[API] Request details:', {
    endpoint,
    baseUrl: requestUrl,
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
    const defaultQuery = {
      sort: ['Order:asc'],
      populate: {
        Image: { fields: ['url', 'alternativeText', 'width', 'height', 'formats'] },
        products: {
          sort: ['Order:asc'],
          populate: {
            MainImage: { fields: ['url', 'alternativeText', 'width', 'height', 'formats'] }
          }
        }
      },
      ...query
    };

    const response = await fetchAPI<StrapiResponse<any>>('/api/product-categories', defaultQuery);
    
    if (response?.data) {
      response.data.sort((a: BaseProductCategory, b: BaseProductCategory) => a.Order - b.Order);
    }

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

export const getImageUrl = (path: string) => {
  if (!path) return '';
  if (path.startsWith('http')) return path;
  return `${getStrapiUrl()}${path}`;
};

export const getWelcomeContent = async (): Promise<StrapiResponse<WelcomeSectionData>> => {
  return await fetchAPI('/api/welcome-section', { populate: '*' });
};

export const submitSalesFunnelInquiry = async (
  inquiryData: SalesFunnelFormData
): Promise<{ success: boolean; data?: any; error?: string }> => {
  try {
    // First create contact form
    const contactResponse = await fetchAPI('/api/contact-forms', {
      method: 'POST',
      body: JSON.stringify({ 
        data: {
          name: inquiryData.contact.name,
          email: inquiryData.contact.email,
          phone: inquiryData.contact.phone || null,
          company: inquiryData.contact.company || null,
          message: `Sales Funnel Inquiry - Budget: ${inquiryData.budget}`,
          wantContact: inquiryData.contact.wantContact || false,
          method: inquiryData.contact.method || null,
          time: inquiryData.contact.time || null,
          privacy: inquiryData.contact.privacy,
          newsletter: inquiryData.contact.newsletter || false
        }
      })
    });

    if (!contactResponse.ok) {
      throw new Error('Failed to create contact form');
    }

    const contactData = await contactResponse.json();

    // Then create sales inquiry with all additional info fields
    const salesResponse = await fetchAPI('/api/sales-inquiries', {
      method: 'POST',
      body: JSON.stringify({
        data: {
          products: inquiryData.products,
          budget: inquiryData.budget,
          timeline: inquiryData.timeline,
          contact: contactData.data.id,
          location: inquiryData.additionalInfo?.location,
          householdSize: inquiryData.additionalInfo?.householdSize,
          livingSituation: inquiryData.additionalInfo?.livingSituation,
          specificRequirements: inquiryData.additionalInfo?.specificRequirements,
          customizationNeeds: inquiryData.additionalInfo?.customizationNeeds || [],
          preferredFeatures: inquiryData.additionalInfo?.preferredFeatures || [],
          painPoints: inquiryData.additionalInfo?.painPoints
        }
      })
    });

    // Add detailed error logging
    if (!salesResponse.ok) {
      const errorData = await salesResponse.json();
      console.error('Sales inquiry submission details:', {
        requestBody: inquiryData,
        responseStatus: salesResponse.status,
        responseError: errorData
      });
      throw new Error(`Failed to create sales inquiry: ${JSON.stringify(errorData)}`);
    }

    const salesData = await salesResponse.json();
    return {
      success: true,
      data: {
        contact: contactData.data,
        salesInquiry: salesData.data
      }
    };
  } catch (error) {
    console.error('API Error:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Ein unerwarteter Fehler ist aufgetreten'
    };
  }
};

interface ProductApiResponse {
  data: Product[];
  meta: {
    pagination?: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
}

export const getCategoryProducts = async (slug: string): Promise<ProductApiResponse> => {
  try {
    console.log('[API] getCategoryProducts called with:', { slug });

    const response = await fetchAPI<ProductApiResponse>(
      '/api/products',
      {
        sort: ['Order:asc'],
        filters: {
          product_category: {
            slug: {
              $eq: slug,
            },
          },
        },
        populate: {
          MainImage: {
            fields: ['url', 'alternativeText', 'width', 'height'],
          },
          product_category: {
            fields: ['Title', 'slug'],
          },
        },
      }
    );

    // Transform the response to match expected structure
    const transformedResponse: ProductApiResponse = {
      data: response.data.map(product => ({
        id: product.id,
        attributes: {
          Name: product.Name,
          ShortDescription: product.ShortDescription,
          DetailedDescription: product.DetailedDescription,
          Features: product.Features,
          Order: product.Order,
          MainImage: {
            data: {
              id: product.MainImage?.id,
              attributes: {
                url: product.MainImage?.url,
                width: product.MainImage?.width,
                height: product.MainImage?.height,
                alternativeText: product.MainImage?.alternativeText
              }
            }
          },
          product_category: {
            data: {
              id: product.product_category?.id,
              attributes: {
                Title: product.product_category?.Title,
                slug: product.product_category?.slug
              }
            }
          }
        }
      })),
      meta: response.meta
    };

    return transformedResponse;
  } catch (error) {
    console.error('[API] getCategoryProducts error:', {
      slug,
      error: error instanceof Error ? error.message : String(error),
    });
    return {
      data: [],
      meta: {
        pagination: {
          page: 1,
          pageSize: 0,
          pageCount: 0,
          total: 0,
        },
      },
    };
  }
};

interface AdditionalInformation {
  location?: string;
  householdSize?: string;
  livingSituation?: string;
  specificRequirements?: string;
  customizationNeeds?: string[];
  preferredFeatures?: string[];
  painPoints?: string;
}

export async function getImpressumData(): Promise<StrapiResponse<ImpressumData>> {
  try {
    // Log the URL being constructed
    const baseUrl = getStrapiUrl();
    console.log('[Impressum] Base URL:', baseUrl);
    
    // Log the full request details
    console.log('[Impressum] Making request to:', '/api/impressum', {
      populate: '*'
    });

    const response = await fetchAPI<StrapiResponse<ImpressumData>>('/api/impressum', {
      populate: '*'
    });

    // Log the response
    console.log('[Impressum] Response received:', response);

    if (!response?.data) {
      console.error('[Impressum] No data in response:', response);
      throw new Error('No data received from API');
    }

    return response;
  } catch (error) {
    // Enhanced error logging
    console.error('[Impressum] API Error:', {
      error: error instanceof Error ? {
        message: error.message,
        stack: error.stackv
      } : error,
      timestamp: new Date().toISOString()
    });
    throw error;
  }
}

// Function to get AGB data
export async function getAGBData(): Promise<StrapiResponse<any>> {
  try {
    const response = await fetchAPI<StrapiResponse<any>>('/api/impressum', {
      populate: {
        agb: {
          populate: '*'
        }
      }
    });
    
    console.log('[AGB] Response:', response?.data?.attributes?.agb);
    return response;
  } catch (error) {
    console.error('[AGB] API Error:', error);
    throw error;
  }
}

// Function to get Data Policy
export async function getDataPolicyData(): Promise<StrapiResponse<any>> {
  try {
    const response = await fetchAPI<StrapiResponse<any>>('/api/impressum', {
      populate: {
        data_policy: {
          populate: '*'
        }
      }
    });
    
    console.log('[DataPolicy] Full API Response:', response);
    return response;
  } catch (error) {
    console.error('[DataPolicy] API Error:', error);
    throw error;
  }
}
