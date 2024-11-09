// src/types/content.ts
import { StrapiBaseAttributes, StrapiMedia, StrapiMediaFormat, StrapiMediaFormats } from './strapi';
import { Product, BaseProductCategory } from './common';

export interface MediaItem {
  id: number;
  name: string;
  alternativeText: string | null;
  caption: string | null;
  width: number;
  height: number;
  formats: StrapiMediaFormats;
  url: string;
}

interface HeroSectionAttributes extends StrapiBaseAttributes {
  documentId: string;
  Title: string;
  Description: string;
  CallToActionText: string;
  CallToActionLink: string;
}

export type IconType = 'SHIELD' | 'HOME' | 'HEART' | 'GEAR' | 'CLOCK' | 'DEFAULT';

interface FeatureItem {
  id: number;
  title: string;
  icon: IconType;
}

export interface HeroSectionData {
  id: number;
  documentId: string;
  Title: string;
  Description: string;
  CallToActionText: string;
  CallToActionLink: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  BackgroundImage?: {
    id: number;
    documentId: string;
    name: string;
    alternativeText: string | null;
    caption: string | null;
    width: number;
    height: number;
    formats: {
      large?: StrapiMediaFormat;
      medium?: StrapiMediaFormat;
      small?: StrapiMediaFormat;
      thumbnail?: StrapiMediaFormat;
    };
    hash: string;
    ext: string;
    mime: string;
    size: number;
    url: string;
    previewUrl: string | null;
    provider: string;
    provider_metadata: any | null;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
  };
  featureitems: FeatureItem[];
}

interface WelcomeSectionAttributes extends StrapiBaseAttributes {
  documentId: string;
  Title: string;
  Paragraphs: string;
  Catchheader: string;
  Catchtext: string;
  Catchimage?: StrapiMedia;
}

export interface WelcomeSectionData {
  id: number;
  documentId: string;
  Title: string;
  Paragraphs: string;
  Catchheader: string;
  Catchtext: string;
  Catchimage?: {
    id: number;
    name: string;
    alternativeText: string | null;
    caption: string | null;
    width: number;
    height: number;
    formats: {
      large?: StrapiMediaFormat;
      medium?: StrapiMediaFormat;
      small?: StrapiMediaFormat;
      thumbnail?: StrapiMediaFormat;
    };
    hash: string;
    ext: string;
    mime: string;
    size: number;
    url: string;
    previewUrl: string | null;
    provider: string;
    provider_metadata: any | null;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
  };
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
}

export type ProductCategoryData = BaseProductCategory;

export interface UeberUnsData {
  id: number;
  attributes: {
    documentId: string;
    Title: string;
    Description: string;
    slug: string;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
  };
}

export interface FAQData {
  id: number;
  documentId: string;
  Question: string;
  Answer: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
}

export interface ContactSectionData {
  title: string;
  subtitle: string;
  address: {
    street: string;
    city: string;
    postal_code: string;
    phone: string;
    email: string;
    opening_hours: string;
  };
  contact_form: {
    success_message: string;
    error_message: string;
    privacy_text: string;
    newsletter_text: string;
    submit_button_text: string;
  };
}
  