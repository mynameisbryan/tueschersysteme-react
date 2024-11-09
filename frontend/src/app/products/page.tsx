import { Metadata } from 'next';
import { getProductCategories } from '@/utils/api';
import ProductsClient from './products-client';
import { notFound } from 'next/navigation';

export const metadata: Metadata = {
  title: 'Produkte | Tüscher Systeme',
  description: 'Entdecken Sie unsere hochwertigen Insektenschutz- und Sonnenschutzlösungen',
};

export const dynamic = 'force-dynamic';

export default async function ProductsPage() {
  try {
    const categoriesResponse = await getProductCategories({
      pagination: { page: 1, pageSize: 100 },
      populate: '*'
    });

    if (!categoriesResponse?.data?.length) {
      notFound();
    }

    return (
      <ProductsClient 
        categories={categoriesResponse.data}
        defaultCategory={categoriesResponse.data[0]}
      />
    );
  } catch (error) {
    console.error('[Products] Error:', error);
    throw error;
  }
}