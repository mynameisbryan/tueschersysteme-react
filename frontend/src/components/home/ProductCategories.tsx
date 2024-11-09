// src/components/home/ProductCategories.tsx
import { default as NextImage } from 'next/image';
import Link from 'next/link';
import { fetchAPI, getStrapiMediaUrl } from '@/utils/api';
import { ProductCategoryData } from '@/types/content';
import { StrapiError, StrapiResponse, StrapiImageFormat } from '@/types/strapi';

interface RawImageData {
  id: number;
  url: string;
  alternativeText: string | null;
  width: number;
  height: number;
  formats?: {
    [key: string]: StrapiImageFormat;
  };
}

async function getProductCategories(page = 1, pageSize = 9): Promise<StrapiResponse<ProductCategoryData[]>> {
  try {
    const response = await fetchAPI<StrapiResponse<ProductCategoryData[]>>('/api/product-categories', {
      pagination: { page, pageSize },
      populate: '*'
    });

    const transformedData: StrapiResponse<ProductCategoryData[]> = {
      data: response.data.map(item => ({
        id: item.id,
        attributes: {
          documentId: (item as any).documentId,
          Title: (item as any).Title,
          Description: (item as any).Description,
          slug: (item as any).slug,
          Image: {
            data: Array.isArray((item as any).Image) 
              ? (item as any).Image.map((img: RawImageData) => ({
                  id: img.id,
                  attributes: {
                    url: img.url,
                    alternativeText: img.alternativeText || '',
                    width: img.width,
                    height: img.height,
                    formats: img.formats || {}
                  }
                })) 
              : []
          },
          createdAt: (item as any).createdAt,
          updatedAt: (item as any).updatedAt,
          publishedAt: (item as any).publishedAt
        }
      })),
      meta: response.meta
    };

    return transformedData;
  } catch (error) {
    console.error('Full error details:', error);
    throw error as StrapiError;
  }
}

export default async function ProductCategories() {
  try {
    const response = await getProductCategories();
    console.log('Transformed response:', JSON.stringify(response, null, 2));

    if (!response?.data || response.data.length === 0) {
      return (
        <section className="py-16 bg-gray-100">
          <div className="container mx-auto px-4">
            <h2 className="text-3xl font-bold text-center mb-12">Produktkategorien</h2>
            <p className="text-center">Keine Kategorien verfügbar.</p>
          </div>
        </section>
      );
    }

    return (
      <section className="section bg-gray-100">
        <div className="container-padding">
          <h2 className="section-title">Produktkategorien</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {response.data.map((category) => {
              const { Title = 'Untitled', Description = '', slug = '#', Image } = category.attributes || {};
              const imageData = Image?.data?.[0]?.attributes;
              const imageUrl = imageData?.url;
              const altText = imageData?.alternativeText || Title;

              return (
                <article key={category.id} className="card card-hover">
                  {imageUrl ? (
                    <NextImage
                      src={getStrapiMediaUrl(imageUrl)}
                      alt={altText}
                      width={400}
                      height={300}
                      className="w-full h-48 object-cover"
                    />
                  ) : (
                    <div className="w-full h-48 bg-gray-200 flex items-center justify-center">
                      <p className="text-gray-500">No image available</p>
                    </div>
                  )}
                  <div className="p-6 space-y-4">
                    <h3 className="text-lg font-semibold">{Title}</h3>
                    <p className="text-gray-600">{Description || 'No description available'}</p>
                    <Link 
                      href={`/products/${slug}`} 
                      className="inline-block text-tuscher-blue hover:text-tuscher-light transition-colors"
                    >
                      Mehr erfahren
                    </Link>
                  </div>
                </article>
              );
            })}
          </div>
        </div>
      </section>
    );
  } catch (error) {
    console.error('Error in ProductCategories:', error);
    return (
      <section className="py-16 bg-gray-100">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Produktkategorien</h2>
          <p className="text-center text-red-600">Fehler beim Laden der Kategorien.</p>
        </div>
      </section>
    );
  }
}
