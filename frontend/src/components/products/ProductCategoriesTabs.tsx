'use client';

import { useState, useMemo } from 'react';
import Image from 'next/image';
import { BaseProductCategory } from '@/types/common';
import { getImageUrl } from '@/utils/api';
import { cn } from '@/utils/cn';

interface ProductCategoriesProps {
  categories: BaseProductCategory[];
}

export default function ProductCategoryTabs({ categories }: ProductCategoriesProps) {
  // Sort categories by ID using useMemo to avoid unnecessary re-sorting
  const sortedCategories = useMemo(() => {
    return [...categories].sort((a, b) => (a.Order || 0) - (b.Order || 0));
  }, [categories]);

  const [activeCategory, setActiveCategory] = useState<string>(
    sortedCategories[0]?.slug || ''
  );

  return (
    <section className="py-12 bg-white">
      <div className="container">
        <div className="overflow-x-auto pb-4 scrollbar-hide">
          <div className="flex space-x-4 min-w-max">
            {sortedCategories.map((category) => {
              const imageUrl = category.Image?.[0]?.url;
              
              return (
                <button
                  key={category.id}
                  onClick={() => setActiveCategory(category.slug)}
                  className={cn(
                    "relative flex-shrink-0 w-72 overflow-hidden rounded-xl transition-all duration-300",
                    "hover:shadow-lg hover:scale-[1.02]",
                    activeCategory === category.slug ? "ring-2 ring-[var(--color-primary)]" : ""
                  )}
                >
                  <div className="relative aspect-[16/9]">
                    <Image
                      src={getImageUrl(imageUrl || '')}
                      alt={category.Title}
                      fill
                      className="object-cover"
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
                  </div>
                  <div className="absolute bottom-0 p-4 text-white">
                    <h3 className="text-lg font-semibold">{category.Title}</h3>
                    <p className="text-sm text-white/80 line-clamp-2">
                      {category.Description}
                    </p>
                  </div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    </section>
  );
} 