import { StrapiBaseAttributes, StrapiImage, StrapiMedia } from './strapi';

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
  attributes: {
    Name: string;
    ShortDescription: string;
    DetailedDescription?: string;
    MainImage: {
      data: {
        attributes: {
          url: string;
          alternativeText?: string;
        };
      };
    };
    Features: string[];
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
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
  attributes: BaseProductCategoryAttributes & {
    documentId?: string;
    products: {
      data: Product[];
    };
  };
} 