'use client';

import { CategoryResponse } from '@/utils/productApi';
import { cn } from '@/utils/cn';

interface CategoryTabsProps {
  categories: CategoryResponse[];
  activeSlug: string;
  onCategoryChange: (slug: string) => void;
}

export default function CategoryTabs({ categories, activeSlug, onCategoryChange }: CategoryTabsProps) {
  if (!categories?.length) {
    return null;
  }

  return (
    <div className="sticky top-0 z-10 bg-white shadow-lg border-b border-gray-200">
      <div className="container mx-auto px-4 py-6">
        <div className="flex gap-4 overflow-x-auto no-scrollbar">
          {categories.map((category) => (
            <button
              key={category.id}
              onClick={() => onCategoryChange(category.slug || '')}
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