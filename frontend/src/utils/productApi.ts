import { fetchAPI } from './api';
import { StrapiResponse, StrapiMediaFormat } from '@/types/strapi';

export interface CategoryResponse {
  id: number;
  documentId: string;
  Title: string;
  Description: string;
  slug: string;
  Image: {
    data: {
      attributes: {
        url: string;
        alternativeText: string;
        width: number;
        height: number;
        formats?: { [key: string]: StrapiMediaFormat };
      }
    }[];
  };
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
}

export interface ProductResponse {
  id: number;
  attributes: {
    Name: string;
    ShortDescription: string;
    DetailedDescription: string;
    Features: string[];
    MainImage: {
      data: {
        attributes: {
          url: string;
          alternativeText: string;
        }
      } | null;
    };
    product_category: {
      id: number;
      Title: string;
      slug: string;
    };
  };
}

interface RawProductResponse {
  data: Array<{
    id: number;
    attributes: {
      Name: string;
      ShortDescription: string;
      DetailedDescription?: string;
      Features?: string[];
      MainImage?: {
        data?: {
          attributes?: {
            url: string;
            alternativeText?: string;
          };
        };
      };
      product_category?: {
        data: {
          id: number;
          attributes: {
            Title: string;
            slug: string;
          };
        };
      };
    };
  }>;
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
}

export const getCategoryProducts = async (slug: string): Promise<StrapiResponse<ProductResponse[]>> => {
  console.log('[ProductAPI] Starting request:', {
    slug,
    timestamp: new Date().toISOString()
  });

  const requestConfig = {
    filters: {
      'product_category.slug': {
        $eq: slug
      }
    },
    populate: {
      MainImage: {
        fields: ['url', 'alternativeText']
      },
      product_category: {
        fields: ['id', 'Title', 'slug']
      }
    }
  };

  try {
    const response = await fetchAPI<RawProductResponse>('/api/products', requestConfig);

    // Validate response structure
    console.log('[ProductAPI] Response validation:', {
      hasData: !!response?.data,
      dataLength: response?.data?.length || 0,
      firstProduct: response?.data?.[0] ? {
        id: response.data[0].id,
        name: response.data[0].attributes?.Name,
        category: response.data[0].attributes?.product_category?.data?.attributes
      } : null,
      meta: response?.meta
    });

    if (!response?.data) {
      throw new Error('Invalid API response structure');
    }

    console.log('[ProductAPI] Response details:', {
      totalProducts: response.data.length,
      hasProducts: response.data.length > 0,
      firstProduct: response.data[0] ? {
        id: response.data[0].id,
        name: response.data[0].attributes.Name,
        categoryData: response.data[0].attributes.product_category
      } : null,
      meta: response.meta
    });

    const transformedData: StrapiResponse<ProductResponse[]> = {
      data: response.data.map(item => ({
        id: item.id,
        attributes: {
          Name: item.attributes.Name || '',
          ShortDescription: item.attributes.ShortDescription || '',
          DetailedDescription: item.attributes.DetailedDescription || '',
          Features: item.attributes.Features || [],
          MainImage: {
            data: item.attributes.MainImage?.data ? {
              attributes: {
                url: item.attributes.MainImage.data.attributes?.url || '',
                alternativeText: item.attributes.MainImage.data.attributes?.alternativeText || ''
              }
            } : null
          },
          product_category: {
            id: item.attributes.product_category?.data?.id || 0,
            Title: item.attributes.product_category?.data?.attributes?.Title || '',
            slug: item.attributes.product_category?.data?.attributes?.slug || ''
          }
        }
      })),
      meta: response.meta
    };

    console.log('[ProductAPI] Transformed data:', {
      count: transformedData.data.length,
      products: transformedData.data.map(p => ({
        name: p.attributes.Name,
        category: p.attributes.product_category.slug
      }))
    });

    return transformedData;
  } catch (error) {
    console.error('[ProductAPI] Error fetching products:', error);
    throw error;
  }
};
