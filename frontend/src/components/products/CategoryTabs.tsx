'use client';

import { CategoryResponse } from '@/types/strapi';
import { cn } from '@/utils/cn';

interface CategoryTabsProps {
  categories: CategoryResponse[];
  activeSlug: string;
  onCategoryChange: (slug: string) => void;
}

export default function CategoryTabs({ categories, activeSlug, onCategoryChange }: CategoryTabsProps) {
  console.log('[CategoryTabs] Rendering:', JSON.stringify({
    categoriesCount: categories?.length,
    activeSlug,
    availableSlugs: categories?.map(c => c.slug)
  }, null, 2));

  const handleCategoryClick = (slug: string) => {
    console.log('[CategoryTabs] Category clicked:', {
      clickedSlug: slug,
      currentActiveSlug: activeSlug,
      availableSlugs: categories.map(c => ({ slug: c.slug, title: c.Title }))
    });
    onCategoryChange(slug);
  };

  if (!categories?.length) {
    console.warn('[CategoryTabs] No categories available');
    return null;
  }

  return (
    <div className="sticky top-0 z-10 bg-white shadow-lg border-b border-gray-200">
      <div className="container mx-auto px-4 py-6">
        <div className="flex gap-4 overflow-x-auto no-scrollbar">
          {categories.map((category) => (
            <button
              key={category.id}
              onClick={() => handleCategoryClick(category.slug || '')}
              className={cn(
                "px-6 py-3 whitespace-nowrap rounded-lg transition-all duration-200",
                "font-medium text-base",
                activeSlug === category.slug
                  ? "bg-tuscher-blue text-white shadow-md"
                  : "bg-gray-100 hover:bg-gray-200 text-gray-700"
              )}
            >
              {category.Title || 'Untitled'}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
} 