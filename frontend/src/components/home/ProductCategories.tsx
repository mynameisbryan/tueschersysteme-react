// src/components/home/ProductCategories.tsx
import { default as NextImage } from 'next/image';
import Link from 'next/link';
import { fetchAPI, getImageUrl } from '@/utils/api';
import { HomeProductCategory } from '@/types/common';
import { StrapiError, StrapiResponse, StrapiMediaFormat } from '@/types/strapi';
import CategoryCTA from '@/components/ui/CategoryCTA';

interface RawImageData {
  id: number;
  url: string;
  alternativeText: string | null;
  width: number;
  height: number;
  formats?: {
    [key: string]: StrapiMediaFormat;
  };
}

async function getProductCategories(page = 1, pageSize = 9): Promise<StrapiResponse<HomeProductCategory[]>> {
  try {
    const response = await fetchAPI<StrapiResponse<HomeProductCategory[]>>('/api/product-categories', {
      pagination: { page, pageSize },
      populate: '*'
    });

    const transformedData: StrapiResponse<HomeProductCategory[]> = {
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
      <section id="products-section" className="section bg-white">
        <div className="container">
          <h2 className="section-title">Unsere Produkte</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8">
            {response.data.map((category) => {
              const { Title = 'Untitled', Description = '', slug = '#', Image } = category.attributes || {};
              const imageData = Image?.data?.[0]?.attributes;
              const imageUrl = imageData?.url;
              const altText = imageData?.alternativeText || Title;

              return (
                <Link 
                  key={category.id}
                  href={`/products?category=${slug}`}
                  className="card card-hover group"
                >
                  <div className="relative aspect-[16/9] overflow-hidden">
                    <NextImage
                      src={getImageUrl(imageUrl)}
                      alt={altText}
                      fill
                      className="object-cover transition-transform duration-300 
                               group-hover:scale-105"
                    />
                  </div>
                  <div className="p-6">
                    <h3 className="text-xl font-bold text-tuscher-blue mb-2">
                      {Title}
                    </h3>
                    <p className="text-tuscher-blue/70 mb-4">
                      {Description}
                    </p>
                    <div className="flex flex-col space-y-4">
                      <CategoryCTA href={`/products?category=${slug}`}>
                        Produkte entdecken
                      </CategoryCTA>
                    </div>
                  </div>
                </Link>
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
