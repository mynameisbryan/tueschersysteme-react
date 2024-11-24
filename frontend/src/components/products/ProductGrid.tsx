import { ProductApiResponse } from '@/types/strapi';
import ProductCard from './ProductCard';
import LoadingGrid from './LoadingGrid';
import { getImageUrl } from '@/utils/api';

interface ProductGridProps {
  products: ProductApiResponse['data'];
  isLoading: boolean;
  activeCategory: string;
}

export default function ProductGrid({ products, isLoading, activeCategory }: ProductGridProps) {
  if (isLoading) return <LoadingGrid />;

  return (
    <div className="container mx-auto">
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 p-4 sm:p-6 lg:p-8 max-w-7xl mx-auto">
        {products.map((product) => {
          console.log('[ProductGrid] Processing product:', {
            name: product.Name,
            rawMainImage: product.MainImage,
            rawUrl: product.MainImage?.url
          });

          const imageUrl = product.MainImage?.url 
            ? getImageUrl(product.MainImage.url)
            : null;

          console.log('[ProductGrid] Constructed image URL:', {
            name: product.Name,
            imageUrl,
            hasUrl: !!imageUrl
          });

          return (
            <ProductCard
              key={product.id}
              title={product.Name}
              description={product.ShortDescription}
              imageUrl={imageUrl}
              imageAlt={product.Name}
              features={product.Features || []}
              category={product.product_category?.Title || 'Kategorie'}
            />
          );
        })}
      </div>
    </div>
  );
} 