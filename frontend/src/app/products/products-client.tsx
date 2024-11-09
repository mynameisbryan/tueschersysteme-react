'use client';

import { useState, useEffect } from 'react';
import { BaseProductCategory } from '@/types/common';
import ProductHero from '@/components/products/ProductHero';
import CategoryTabs from '@/components/products/CategoryTabs';
import ProductGrid from '@/components/products/ProductGrid';
import { getImageUrl } from '@/utils/api';

interface ProductsClientProps {
  categories: BaseProductCategory[];
  defaultCategory: BaseProductCategory;
}

export default function ProductsClient({ categories, defaultCategory }: ProductsClientProps) {
  const [activeCategory, setActiveCategory] = useState(defaultCategory);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    setIsLoading(false);
  }, []);

  const handleCategoryChange = (slug: string) => {
    const newCategory = categories.find(cat => cat.attributes.slug === slug);
    if (newCategory) {
      setActiveCategory(newCategory);
    }
  };

  return (
    <main className="flex flex-col min-h-screen">
      <ProductHero
        title={activeCategory.attributes.Title}
        description={activeCategory.attributes.Description}
        image={getImageUrl(activeCategory.attributes.Image?.data?.[0]?.attributes?.url)}
        altText={activeCategory.attributes.Image?.data?.[0]?.attributes?.alternativeText || ''}
      />
      
      <div className="animate-spin">Loading...</div>
      
      <CategoryTabs 
        categories={categories}
        activeSlug={activeCategory.attributes.slug}
        onCategoryChange={handleCategoryChange}
      />
      
      <ProductGrid 
        products={activeCategory.attributes.products?.data || []}
        activeCategory={activeCategory.attributes.Title}
      />
    </main>
  );
}