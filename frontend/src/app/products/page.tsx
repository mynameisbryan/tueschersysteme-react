import { Metadata } from 'next';
import { getProductCategories } from '@/utils/api';
import ProductsClient from './products-client';
import { notFound } from 'next/navigation';
import { CategoryResponse } from '@/types/strapi';
import ErrorBoundary from '@/components/ErrorBoundary';

export const metadata: Metadata = {
  title: 'Produkte | Tüscher Systeme',
  description: 'Entdecken Sie unsere hochwertigen Insektenschutz- und Sonnenschutzlösungen',
};

export const dynamic = 'force-dynamic';

export default async function ProductsPage() {
  try {
    const categoriesResponse = await getProductCategories({
      populate: {
        Image: {
          fields: ['url', 'alternativeText', 'width', 'height', 'formats']
        },
        products: {
          populate: {
            MainImage: { fields: ['url', 'alternativeText', 'width', 'height', 'formats'] }
          }
        }
      }
    });

    const transformedCategories: CategoryResponse[] = categoriesResponse.data.map(cat => ({
      id: cat.id,
      documentId: cat.documentId,
      Title: cat.Title,
      Description: cat.Description,
      slug: cat.slug,
      Image: {
        data: cat.Image.map(img => ({
          attributes: {
            url: img.url,
            alternativeText: img.alternativeText || '',
            width: img.width,
            height: img.height,
            formats: img.formats
          }
        }))
      },
      createdAt: cat.createdAt,
      updatedAt: cat.updatedAt,
      publishedAt: cat.publishedAt
    }));

    if (!transformedCategories.length) {
      console.error('[ProductsPage] No categories available');
      notFound();
    }

    const defaultCategory = transformedCategories[0];
    if (!defaultCategory?.slug) {
      console.error('[ProductsPage] Invalid default category');
      notFound();
    }

    return (
      <ErrorBoundary>
        <ProductsClient 
          categories={transformedCategories}
          defaultCategory={defaultCategory}
        />
      </ErrorBoundary>
    );
  } catch (error) {
    console.error('[Products] Error:', error);
    throw error;
  }
}