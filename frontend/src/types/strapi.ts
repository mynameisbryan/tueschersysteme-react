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
  ext: string;
  url: string;
  hash: string;
  mime: string;
  name: string;
  size: number;
  width: number;
  height: number;
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
      alternativeText?: string;
      width: number;
      height: number;
      formats?: {
        thumbnail?: {
          url: string;
          width: number;
          height: number;
        };
        small?: {
          url: string;
          width: number;
          height: number;
        };
        medium?: {
          url: string;
          width: number;
          height: number;
        };
        large?: {
          url: string;
          width: number;
          height: number;
        };
      };
    };
  };
}

export interface Product {
  id: number;
  attributes: {
    Name: string;
    ShortDescription: string;
    DetailedDescription: string;
    Features: string[];
    MainImage: StrapiSingleMedia;
    GalleryImages: StrapiMedia;
    CTALink?: string;
  } & StrapiBaseAttributes;
}

export interface StrapiMediaFormats {
  large?: StrapiMediaFormat;
  medium?: StrapiMediaFormat;
  small?: StrapiMediaFormat;
  thumbnail?: StrapiMediaFormat;
} 