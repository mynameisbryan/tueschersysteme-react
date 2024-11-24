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

    console.log('[ProductAPI] Raw response:', JSON.stringify(response.data[0]?.attributes?.MainImage, null, 2));
    
    return response;
  } catch (error) {
    console.error('[ProductAPI] Error fetching products:', error);
    return { 
      data: [], 
      meta: { pagination: { page: 1, pageSize: 0, pageCount: 0, total: 0 } } 
    };
  }
};

export const getProductCategories = async () => {
  try {
    const response = await fetchAPI('/api/product-categories', {
      populate: ['Image'],
      fields: ['Title', 'Description', 'ShortDescription', 'slug', 'Order']
    });
    
    console.log('[ProductAPI] Raw category data:', {
      firstCategory: response.data[0]?.attributes,
      availableFields: Object.keys(response.data[0]?.attributes || {})
    });
    
    const transformed = {
      data: response.data.map((category: any) => {
        console.log('[ProductAPI] Category fields:', {
          id: category.id,
          fields: Object.keys(category.attributes),
          shortDesc: category.attributes.ShortDescription,
          shortDescriptionField: category.attributes['ShortDescription']
        });

        return {
          id: category.id,
          Title: category.attributes.Title,
          ShortDescription: category.attributes.ShortDescription,
          Description: category.attributes.Description,
          slug: category.attributes.slug,
          Image: category.attributes.Image
        };
      })
    };
    
    return transformed;
  } catch (error) {
    console.error('[ProductAPI] Error fetching categories:', error);
    return { data: [] };
  }
};
  