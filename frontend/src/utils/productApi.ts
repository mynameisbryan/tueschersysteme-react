import { fetchAPI } from './api';
import { ProductApiResponse } from '@/types/strapi';

export const getCategoryProducts = async (slug: string): Promise<ProductApiResponse> => {
  try {
    const response = await fetchAPI<ProductApiResponse>(
      '/api/products',
      {
        sort: ['Order:asc'],
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

    return response;
  } catch (error) {
    console.error('[ProductAPI] Error fetching products:', error);
    return { 
      data: [], 
      meta: { pagination: { page: 1, pageSize: 0, pageCount: 0, total: 0 } } 
    };
  }
};
  