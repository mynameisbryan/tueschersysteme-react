import { StrapiBaseAttributes, StrapiImage, StrapiMedia, StrapiMediaFormat } from './strapi';

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

export interface Product {
  id: number;
  Name: string;
  Order: number;
  ShortDescription: string;
  DetailedDescription?: string;
  Features?: string[];
  MainImage?: {
    data?: {
      attributes?: {
        url: string;
        alternativeText?: string;
        width?: number;
        height?: number;
        formats?: {
          [key: string]: StrapiMediaFormat;
        };
      };
    };
  };
  GalleryImages?: {
    data?: Array<{
      attributes?: {
        url: string;
        alternativeText?: string;
        width?: number;
        height?: number;
        formats?: {
          [key: string]: StrapiMediaFormat;
        };
      };
    }>;
  };
  product_category: {
    Title: string;
    slug: string;
  };
}

// Base interface für gemeinsame Eigenschaften
export interface BaseProductCategoryAttributes {
  Title: string;
  Description: string;
  slug: string;
  Image: StrapiMedia;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
}

// Für die Home-Page (ohne products)
export interface HomeProductCategory {
  id: number;
  attributes: BaseProductCategoryAttributes & {
    documentId?: string;
  };
}

// Für die Products-Page (mit products)
export interface BaseProductCategory {
  id: number;
  Order: number;
  documentId: string;
  Title: string;
  Description: string;
  slug: string;
  Image: Array<{
    id: number;
    url: string;
    alternativeText: string | null;
    width: number;
    height: number;
    formats?: {
      [key: string]: StrapiMediaFormat;
    };
  }>;
  products: {
    data: Array<{
      id: number;
      attributes: {
        Name: string;
        ShortDescription: string;
        MainImage?: {
          data?: {
            attributes?: {
              url?: string;
            };
          };
        };
        Features?: string[];
      };
    }>;
  };
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
} 