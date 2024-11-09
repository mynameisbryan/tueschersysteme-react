// src/types/content.ts
import { StrapiBaseAttributes, StrapiImageFormat, StrapiMedia } from './strapi';

interface MediaFormat {
  ext: string;
  url: string;
  hash: string;
  mime: string;
  name: string;
  size: number;
  width: number;
  height: number;
}

interface MediaFormats {
  large?: MediaFormat;
  medium?: MediaFormat;
  small?: MediaFormat;
  thumbnail?: MediaFormat;
}

export interface MediaItem {
  id: number;
  name: string;
  alternativeText: string | null;
  caption: string | null;
  width: number;
  height: number;
  formats: MediaFormats;
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

export interface ImageFormat {
  ext: string;
  url: string;
  hash: string;
  mime: string;
  name: string;
  size: number;
  width: number;
  height: number;
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
      large?: ImageFormat;
      medium?: ImageFormat;
      small?: ImageFormat;
      thumbnail?: ImageFormat;
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
      large?: ImageFormat;
      medium?: ImageFormat;
      small?: ImageFormat;
      thumbnail?: ImageFormat;
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

export interface ProductCategoryData {
  id: number;
  attributes: StrapiBaseAttributes & {
    Title: string;
    Description: string;
    slug: string;
    Image: StrapiMedia;
  };
}

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

export type { MediaFormat, MediaFormats };
  