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

export interface StrapiImageFormat {
  ext: string;
  url: string;
  hash: string;
  mime: string;
  name: string;
  size: number;
  width: number;
  height: number;
}

export interface StrapiMedia {
  data: Array<{
    id: number;
    attributes: {
      url: string;
      alternativeText: string | null;
      formats: {
        [key: string]: StrapiImageFormat;
      };
    };
  }>;
}

export interface StrapiMediaAttributes extends StrapiBaseAttributes {
  url: string;
  alternativeText?: string;
  width: number;
  height: number;
  formats?: {
    [key: string]: {
      url: string;
      width: number;
      height: number;
    };
  };
} 