import { fetchAPI } from './api';
import { ProductApiResponse } from '@/types/strapi';

export const getCategoryProducts = async (slug: string): Promise<ProductApiResponse> => {
  try {
    const response = await fetchAPI<ProductApiResponse>(
      '/api/products',
      {
        filters: {
          product_category: {
            slug: {
              $eq: slug
            }
          }
        },
        populate: {
          MainImage: {
            fields: ['url', 'alternativeText', 'width', 'height']
          },
          product_category: {
            fields: ['Title', 'slug']
          }
        }
      }
    );

    if (!response?.data) {
      console.warn('[ProductAPI] No data in response');
      return { data: [], meta: { pagination: { page: 1, pageSize: 0, pageCount: 0, total: 0 } } };
    }

    return response;
  } catch (error) {
    console.error('[ProductAPI] Error fetching products:', error);
    // Return empty data instead of throwing
    return { data: [], meta: { pagination: { page: 1, pageSize: 0, pageCount: 0, total: 0 } } };
  }
};
  