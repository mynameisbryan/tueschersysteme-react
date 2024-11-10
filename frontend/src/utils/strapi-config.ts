import { fetchAPI } from './api';
import { 
  StrapiCollectionResponse, 
  CategoryResponse, 
  StrapiProductAttributes,
  StrapiVerificationResult 
} from '@/types/strapi';

export const verifyStrapiConfig = async (): Promise<StrapiVerificationResult> => {
  try {
    const categoriesResponse = await fetchAPI<StrapiCollectionResponse<CategoryResponse>>('/api/product-categories', {
      queryParams: {
        populate: {
          Image: {
            fields: ['url', 'alternativeText', 'width', 'height', 'formats']
          }
        }
      }
    });

    const productsResponse = await fetchAPI<StrapiCollectionResponse<StrapiProductAttributes>>('/api/products', {
      queryParams: {
        populate: ['MainImage', 'product_category']
      }
    });

    return {
      success: true,
      categoriesCount: categoriesResponse.data?.length || 0,
      productsCount: productsResponse.data?.length || 0
    };
  } catch (error) {
    console.error('[StrapiConfig] Verification failed:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    };
  }
}; 