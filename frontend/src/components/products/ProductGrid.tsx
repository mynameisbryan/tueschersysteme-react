import { motion, AnimatePresence } from 'framer-motion';
import { ProductResponse } from '@/utils/productApi';
import ProductCard from './ProductCard';
import { getImageUrl } from '@/utils/api';
import LoadingGrid from './LoadingGrid';

interface ProductGridProps {
  products: ProductResponse[];
  isLoading: boolean;
  activeCategory: string;
}

export default function ProductGrid({ products, isLoading, activeCategory }: ProductGridProps) {
  console.log('[ProductGrid] Rendering with:', {
    productsCount: products?.length || 0,
    isLoading,
    activeCategory,
    productNames: products?.map(p => p.attributes?.Name).filter(Boolean) || []
  });

  if (isLoading) {
    return <LoadingGrid />;
  }

  if (!products || products.length === 0) {
    console.log('[ProductGrid] No products available:', {
      productsExist: !!products,
      isArray: Array.isArray(products),
      categorySlug: activeCategory
    });
    return (
      <div className="container mx-auto px-4">
        <div className="text-center py-12">
          <p className="text-gray-600">
            Keine Produkte in dieser Kategorie verfügbar.
            {process.env.NODE_ENV === 'development' && (
              <span className="block text-sm text-gray-400 mt-2">
                Debug: {JSON.stringify({
                  productsLength: products?.length,
                  isArray: Array.isArray(products),
                  categorySlug: activeCategory
                })}
              </span>
            )}
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-4">
      {products.map((product) => (
        <ProductCard
          key={product.id}
          title={product.attributes.Name}
          description={product.attributes.ShortDescription}
          image={product.attributes.MainImage?.data?.attributes?.url}
          features={product.attributes.Features || []}
          category={activeCategory}
        />
      ))}
    </div>
  );
} 