import { StrapiBaseAttributes, StrapiResponse } from './strapi';

export interface SalesFunnelInquiry {
  products: string[];
  budget: string;
  timeline: string;
  contact: {
    name: string;
    email: string;
    phone?: string;
    company?: string;
  };
}

export interface SalesFunnelResponse {
  data: {
    id: number;
    documentId: string;
    attributes: {
      products: Array<{
        category: string;
        name: string;
        quantity: number;
      }>;
      budget: string;
      timeline: string;
      contact: {
        id: number;
        documentId: string;
        name: string;
        email: string;
        phone?: string;
        company?: string;
        message: string;
        wantContact: boolean;
        method?: 'phone' | 'email';
        time?: string;
        privacy: boolean;
        newsletter: boolean;
        createdAt: string;
        updatedAt: string;
        publishedAt: string;
      }
    } & StrapiBaseAttributes;
  }
}

export interface AdditionalInformation {
  location?: string;
  householdSize?: string;
  livingSituation?: string;
  specificRequirements?: string;
  customizationNeeds?: string[];
  painPoints?: string;
  preferredFeatures?: string[];
}

export interface SalesFunnelFormData {
  products: Array<{
    category: string;
    name: string;
    quantity: number;
  }>;

  budget: string;
  timeline: 'one_month' | 'three_months' | 'six_months' | 'flexible';
  additionalInfo: AdditionalInformation;
  contact: {
    name: string;
    email: string;
    phone?: string;
    company?: string;
    wantContact?: boolean;
    method?: 'phone' | 'email';
    time?: string;
    privacy: boolean;
    newsletter?: boolean;
  };
}
