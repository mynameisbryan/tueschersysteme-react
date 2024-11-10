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
    <div className="sticky top-[80px] z-30 bg-white/95 backdrop-blur-sm border-b border-gray-200">
      <div className="container mx-auto px-4 py-4 sm:py-6">
        <div className="flex gap-2 sm:gap-4 overflow-x-auto scrollbar-hide -mx-4 px-4 pb-4">
          {categories.map((category) => (
            <button
              key={category.id}
              onClick={() => handleCategoryClick(category.slug || '')}
              className={cn(
                "px-4 sm:px-6 py-2 sm:py-3 whitespace-nowrap rounded-lg transition-all duration-200",
                "text-sm sm:text-base font-medium flex-shrink-0",
                "hover:transform hover:scale-105 active:scale-95",
                activeSlug === category.slug
                  ? "bg-tuscher-blue text-white shadow-lg"
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