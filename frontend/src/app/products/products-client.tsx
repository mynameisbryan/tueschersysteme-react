'use client';

import { useState, useEffect } from 'react';
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
  const [activeCategory, setActiveCategory] = useState<CategoryResponse>(defaultCategory);
  const [products, setProducts] = useState<ProductApiResponse['data']>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Verify Strapi configuration on mount
  useEffect(() => {
    if (process.env.NODE_ENV === 'development') {
      verifyStrapiConfig().then(result => {
        console.log('[ProductsClient] Strapi config verification:', result);
      });
    }
  }, []);

  useEffect(() => {
    if (!activeCategory?.slug) {
      console.warn('[ProductsClient] No active category slug');
      setIsLoading(false);
      setProducts([]); // Clear products when no category is selected
      return;
    }

    let isMounted = true;
    setIsLoading(true);
    setError(null);

    const loadProducts = async () => {
      try {
        const response = await getCategoryProducts(activeCategory.slug);
        
        if (!isMounted) return;

        if (!response?.data) {
          console.warn('[ProductsClient] No products data in response');
          setProducts([]);
          return;
        }

        console.log('[ProductsClient] Products loaded:', {
          count: response.data.length,
          categorySlug: activeCategory.slug
        });

        setProducts(response.data);
      } catch (err) {
        if (!isMounted) return;
        console.error('[ProductsClient] Error loading products:', err);
        setError('Produkte konnten nicht geladen werden');
        setProducts([]); // Ensure we have empty array on error
      } finally {
        if (isMounted) setIsLoading(false);
      }
    };

    loadProducts();

    return () => { isMounted = false; };
  }, [activeCategory?.slug]);

  const handleCategoryChange = (slug: string) => {
    console.log('[ProductsClient] Category change requested:', {
      currentSlug: activeCategory?.slug,
      newSlug: slug
    });
    
    const newCategory = categories.find(cat => cat.slug === slug);
    if (newCategory && newCategory.slug !== activeCategory?.slug) {
      console.log('[ProductsClient] Changing category:', {
        from: activeCategory.slug,
        to: newCategory.slug
      });
      setActiveCategory(newCategory);
    }
  };

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
      <ProductGrid 
        products={products}
        isLoading={isLoading}
        activeCategory={activeCategory.slug}
      />
    </>
  );
}