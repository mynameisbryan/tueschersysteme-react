'use client';

import { BaseProductCategory } from '@/types/common';
import { cn } from '@/utils/cn';

interface CategoryTabsProps {
  categories: BaseProductCategory[];
  activeSlug: string;
  onCategoryChange: (slug: string) => void;
}

export default function CategoryTabs({ categories, activeSlug, onCategoryChange }: CategoryTabsProps) {
  return (
    <div className="sticky top-0 z-10 bg-white shadow-md">
      <div className="container mx-auto px-4 py-4">
        <div className="flex gap-4 overflow-x-auto no-scrollbar">
          {categories.map((category) => (
            <button
              key={category.id}
              onClick={() => onCategoryChange(category.attributes.slug)}
              className={cn(
                "px-4 py-2 whitespace-nowrap rounded-lg transition-colors",
                activeSlug === category.attributes.slug
                  ? "bg-tuscher-blue text-white"
                  : "bg-gray-100 hover:bg-gray-200 text-gray-700"
              )}
            >
              {category.attributes.Title}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
} 