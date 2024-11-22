'use client';

import { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { CategoryResponse, ProductApiResponse } from '@/types/strapi';
import ProductHero from '@/components/products/ProductHero';
import CategoryTabs from '@/components/products/CategoryTabs';
import ProductGrid from '@/components/products/ProductGrid';
import { getCategoryProducts } from '@/utils/productApi';
import { verifyStrapiConfig } from '@/utils/strapi-config';

interface ProductsClientProps {
  categories: CategoryResponse[];
  defaultCategory: CategoryResponse;
}

export default function ProductsClient({ categories, defaultCategory }: ProductsClientProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [activeCategory, setActiveCategory] = useState<CategoryResponse>(defaultCategory);
  const [products, setProducts] = useState<ProductApiResponse['data']>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Handle URL updates when category changes
  const handleCategoryChange = (slug: string) => {
    const newCategory = categories.find(cat => cat.slug === slug);
    if (newCategory && newCategory.slug !== activeCategory?.slug) {
      setActiveCategory(newCategory);
      
      // Update URL without reload
      const params = new URLSearchParams(searchParams.toString());
      params.set('category', slug);
      router.push(`/products?${params.toString()}`, { scroll: false });
    }
  };

  // Load products when category changes
  useEffect(() => {
    if (!activeCategory?.slug) return;

    let isMounted = true;
    setIsLoading(true);
    setError(null);

    const loadProducts = async () => {
      try {
        const response = await getCategoryProducts(activeCategory.slug);
        if (!isMounted) return;
        setProducts(response.data || []);
      } catch (err) {
        if (!isMounted) return;
        console.error('[ProductsClient] Error:', err);
        setError('Produkte konnten nicht geladen werden');
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    loadProducts();
    return () => { isMounted = false; };
  }, [activeCategory?.slug]);

  // Handle error state
  if (error) {
    return (
      <div className="container mx-auto px-4 py-8">
        <div className="bg-red-50 border border-red-200 rounded-lg p-4">
          <p className="text-red-700">{error}</p>
        </div>
      </div>
    );
  }

  return (
    <>
      <ProductHero 
        title={activeCategory.Title}
        description={activeCategory.Description}
        image={activeCategory.Image?.data?.[0]?.attributes?.url}
      />
      <CategoryTabs 
        categories={categories}
        activeSlug={activeCategory.slug}
        onCategoryChange={handleCategoryChange}
      />
      <div id="products">
        <ProductGrid 
          products={products}
          isLoading={isLoading}
          activeCategory={activeCategory.slug}
        />
      </div>
    </>
  );
}