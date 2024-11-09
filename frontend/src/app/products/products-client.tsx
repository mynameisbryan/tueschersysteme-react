'use client';

import { useState, useEffect } from 'react';
import { CategoryResponse, ProductResponse, getCategoryProducts } from '@/utils/productApi';
import ProductHero from '@/components/products/ProductHero';
import CategoryTabs from '@/components/products/CategoryTabs';
import ProductGrid from '@/components/products/ProductGrid';
import { getImageUrl } from '@/utils/api';

interface ProductsClientProps {
  categories: CategoryResponse[];
  defaultCategory: CategoryResponse;
}

export default function ProductsClient({ categories, defaultCategory }: ProductsClientProps) {
  console.log('[ProductsClient] Mounting with:', {
    categoriesCount: categories.length,
    defaultCategorySlug: defaultCategory?.slug,
    defaultCategoryTitle: defaultCategory?.Title,
    categorySlugs: categories.map(c => c.slug),
    hasDefaultCategory: !!defaultCategory
  });

  const [activeCategory, setActiveCategory] = useState(defaultCategory);
  const [products, setProducts] = useState<ProductResponse[]>([]);
  const [isLoading, setIsLoading] = useState(true);

  // Log when activeCategory changes
  useEffect(() => {
    console.log('[ProductsClient] Active category changed:', {
      slug: activeCategory?.slug,
      title: activeCategory?.Title
    });
  }, [activeCategory]);

  useEffect(() => {
    async function loadProducts() {
      if (!activeCategory?.slug) {
        console.error('[ProductsClient] Missing category data:', {
          activeCategory,
          defaultCategory,
          categoriesCount: categories.length,
          allCategories: categories.map(c => ({
            slug: c.slug,
            title: c.Title
          }))
        });
        return;
      }

      setIsLoading(true);
      try {
        console.log('[ProductsClient] Fetching products:', {
          categorySlug: activeCategory.slug,
          categoryTitle: activeCategory.Title,
          timestamp: new Date().toISOString()
        });
        
        const response = await getCategoryProducts(activeCategory.slug);
        
        if (!response?.data) {
          throw new Error('Invalid response structure from API');
        }

        console.log('[ProductsClient] Products loaded:', {
          count: response.data.length,
          products: response.data.map(p => ({
            id: p.id,
            name: p.attributes.Name,
            hasImage: !!p.attributes.MainImage?.data
          }))
        });
        
        setProducts(response.data);
      } catch (error: unknown) {
        const errorDetails = {
          name: error instanceof Error ? error.name : 'Unknown',
          message: error instanceof Error ? error.message : String(error),
          stack: error instanceof Error ? error.stack : undefined,
          category: activeCategory.slug
        };
        
        console.error('[ProductsClient] Product fetch failed:', errorDetails);
        setProducts([]);
      } finally {
        setIsLoading(false);
      }
    }

    loadProducts();
  }, [activeCategory?.slug, categories, defaultCategory]);

  // Log state changes
  useEffect(() => {
    console.log('[ProductsClient] State updated:', {
      isLoading,
      productsCount: products.length
    });
  }, [isLoading, products]);

  // Initial state logging effect
  useEffect(() => {
    console.log('[ProductsClient] Initial state:', {
      activeCategory,
      defaultCategory,
      hasSlug: !!activeCategory?.slug,
      defaultSlug: defaultCategory?.slug
    });
  }, [activeCategory, defaultCategory]);

  useEffect(() => {
    console.log('[ProductsClient] State transition:', {
      timestamp: new Date().toISOString(),
      activeCategory: {
        slug: activeCategory?.slug,
        title: activeCategory?.Title
      },
      isLoading,
      productsCount: products.length,
      hasProducts: products.length > 0,
      firstProduct: products[0]?.attributes?.Name
    });
  }, [activeCategory, isLoading, products]);

  return (
    <>
      <ProductHero 
        title={activeCategory?.Title || 'Unsere Produkte'}
        description={activeCategory?.Description || 'Entdecken Sie unsere Produktpalette'}
        image={activeCategory?.Image?.data?.[0]?.attributes?.url}
      />
      <CategoryTabs 
        categories={categories}
        activeSlug={activeCategory?.slug || ''}
        onCategoryChange={(slug) => {
          console.log('[ProductsClient] Category change requested:', slug);
          const newCategory = categories.find(cat => cat.slug === slug);
          if (newCategory) {
            setActiveCategory(newCategory);
          }
        }}
      />
      <ProductGrid 
        products={products}
        isLoading={isLoading}
        activeCategory={activeCategory?.slug || ''}
      />
    </>
  );
}