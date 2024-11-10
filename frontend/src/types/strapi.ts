import { fetchAPI } from '@/utils/api';

export interface StrapiBaseAttributes {
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
}

export interface StrapiResponse<T> {
  data: T;
  meta: {
    pagination?: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
}

export interface StrapiCollectionResponse<T> extends StrapiResponse<Array<{
  id: number;
  attributes: T;
}>> {}

export interface StrapiSingleResponse<T> extends StrapiResponse<{
  id: number;
} & T> {}

export interface StrapiError {
  data: null;
  error: {
    status: number;
    name: string;
    message: string;
    details?: any;
  };
}

export interface StrapiMediaFormat {
  url: string;
  width: number;
  height: number;
  size: number;
  mime: string;
}

export interface StrapiMediaData {
  id: number;
  attributes: {
    url: string;
    alternativeText: string | null;
    width: number;
    height: number;
    formats: {
      [key: string]: StrapiMediaFormat;
    };
  };
}

export interface StrapiMedia {
  data: StrapiMediaData[];
}

export interface StrapiSingleMedia {
  data: StrapiMediaData;
}

export interface ContactFormEntry {
  id: number;
  attributes: {
    documentId: string;
    name: string;
    email: string;
    phone?: string;
    message: string;
    privacy: boolean;
    newsletter: boolean;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
  };
}

export interface FileResourceData {
  id: number;
  attributes: {
    name: string;
    url: string;
    formats?: {
      thumbnail?: {
        url: string;
      };
    };
  };
}

export interface StrapiImage {
  data: {
    id: number;
    attributes: {
      url: string;
      alternativeText: string;
      width: number;
      height: number;
      formats?: {
        [key: string]: StrapiMediaFormat;
      };
    };
  }[];
}

interface MainImage {
  id: number;
  documentId: string;
  url: string;
  alternativeText: string | null;
  height: number;
  width: number;
}

export interface Product {
  id: number;
  Name: string;
  ShortDescription: string;
  DetailedDescription?: string;
  Features?: string[];
  MainImage?: MainImage;
  product_category: {
    Title: string;
    slug: string;
  };
}

export interface StrapiMediaFormats {
  large?: StrapiMediaFormat;
  medium?: StrapiMediaFormat;
  small?: StrapiMediaFormat;
  thumbnail?: StrapiMediaFormat;
}

export interface StrapiProductResponse {
  Name: string;
  ShortDescription?: string;
  MainImage?: {
    data?: {
      attributes?: {
        url?: string;
      };
    };
  };
  product_category?: {
    data?: {
      attributes?: {
        Title?: string;
        slug?: string;
      };
    };
  };
}

export interface RawProductResponse {
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
        slug: string;
        Title: string;
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

interface FetchAPIConfig {
  // ... existing properties ...
  pagination?: {
    page?: number;
    pageSize?: number;
  };
  populate?: string | string[];
}

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

export interface StrapiVerificationResult {
  success: boolean;
  categoriesCount?: number;
  productsCount?: number;
  error?: string;
}

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

export interface ContactFormConfig {
  privacy_text: string;
  newsletter_text?: string;
  success_message?: string;
  error_message?: string;
  submit_button_text?: string;
}

export interface ContactSectionData {
  id: number;
  attributes: {
    Title: string;
    Description: string;
    contact_form: ContactFormConfig;
    address: {
      street: string;
      postal_code: string;
      city: string;
      phone: string;
      email: string;
      opening_hours: string;
    };
  } & StrapiBaseAttributes;
}

export interface StrapiProductAttributes {
  Name: string;
  ShortDescription: string;
  DetailedDescription?: string;
  Features?: string[];
  MainImage: {
    data: {
      id: number;
      attributes: {
        url: string;
        alternativeText?: string;
        width: number;
        height: number;
        formats?: { [key: string]: StrapiMediaFormat };
      };
    } | null;
  };
  product_category: {
    data: {
      id: number;
      attributes: {
        Title: string;
        slug: string;
      };
    };
  };
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
}

export interface StrapiProduct {
  id: number;
  Name: string;
  ShortDescription: string;
  DetailedDescription?: string;
  Features?: string[];
  MainImage: {
    data: {
      attributes: {
        url: string;
        alternativeText?: string;
        width?: number;
        height?: number;
      };
    } | null;
  };
  product_category: {
    Title: string;
    slug: string;
  };
}

export interface ProductApiResponse {
  data: Array<{
    id: number;
    Name: string;
    ShortDescription: string;
    Features?: string[];
    MainImage?: {
      data?: {
        attributes?: {
          url: string;
          alternativeText?: string;
          width?: number;
          height?: number;
        };
      };
    };
    product_category?: {
      Title: string;
      slug: string;
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