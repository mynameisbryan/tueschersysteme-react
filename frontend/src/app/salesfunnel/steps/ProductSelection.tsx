// ProductSelectionStep.tsx
import React, { useState, useEffect, useRef } from 'react';
import { useFunnel } from '../FunnelContext';
import FunnelStep from '@/components/salesfunnel/FunnelStep';
import { motion, AnimatePresence } from 'framer-motion';
import Image from 'next/image';
import { getProductCategories, getCategoryProducts, getImageUrl } from '@/utils/api';
import { BaseProductCategory } from '@/types/common';
import { ProductApiResponse } from '@/types/strapi';
import { ChevronDownIcon } from '@heroicons/react/20/solid';

interface CategorySelection {
  [categoryId: number]: {
    [productId: number]: number;
  };
}

const ProductSelectionStep = () => {
  const { state, updateState, nextStep, currentStep } = useFunnel();
  const [categories, setCategories] = useState<BaseProductCategory[]>([]);
  const [categoryProducts, setCategoryProducts] = useState<Record<number, ProductApiResponse['data']>>({});
  const [selection, setSelection] = useState<CategorySelection>(() => {
    if (!state.products) return {};
    return state.products.reduce((acc: CategorySelection, item) => {
      const [categoryIdStr, productIdStr, countStr] = item.split(':');
      const categoryId = parseInt(categoryIdStr);
      const productId = parseInt(productIdStr);
      const count = parseInt(countStr);
      return {
        ...acc,
        [categoryId]: {
          ...(acc[categoryId] || {}),
          [productId]: count,
        },
      };
    }, {});
  });
  const [expandedCategory, setExpandedCategory] = useState<number | null>(null);
  const [isLoading, setIsLoading] = useState<boolean>(true);
  const [loadingCategories, setLoadingCategories] = useState<Record<number, boolean>>({});
  const categoryRefs = useRef<{ [key: number]: HTMLDivElement | null }>({});
  const [isAnimating, setIsAnimating] = useState(false);

  useEffect(() => {
    const loadCategories = async () => {
      try {
        const response = await getProductCategories();
        console.log('[ProductSelection] Raw category data:', response.data);
        setCategories(response.data);
      } catch (error) {
        console.error('Failed to load categories:', error);
      } finally {
        setIsLoading(false);
      }
    };
    loadCategories();
  }, []);

  const loadCategoryProducts = async (categoryId: number, categorySlug: string) => {
    if (categoryProducts[categoryId]) return;

    setLoadingCategories((prev) => ({ ...prev, [categoryId]: true }));
    try {
      const productsResponse = await getCategoryProducts(categorySlug);
      console.log('[ProductSelection] Products response:', {
        categoryId,
        firstProduct: productsResponse.data[0],
        firstProductImage: productsResponse.data[0]?.attributes?.MainImage
      });
      
      setCategoryProducts((prev) => ({
        ...prev,
        [categoryId]: productsResponse.data,
      }));
    } catch (error) {
      console.error('Failed to load products:', error);
    } finally {
      setLoadingCategories((prev) => ({ ...prev, [categoryId]: false }));
    }
  };

  const toggleProduct = (categoryId: number, productId: number) => {
    setSelection((prev) => {
      const currentCount = prev[categoryId]?.[productId] || 0;
      const newCount = currentCount === 0 ? 1 : 0;

      return {
        ...prev,
        [categoryId]: {
          ...(prev[categoryId] || {}),
          [productId]: newCount,
        },
      };
    });
  };

  const handleCategoryClick = async (categoryId: number, categorySlug: string) => {
    if (isAnimating) return;
    setIsAnimating(true);
    
    // Load products if needed
    if (!categoryProducts[categoryId]) {
      await loadCategoryProducts(categoryId, categorySlug);
    }
    
    // If clicking the same category, just collapse it
    if (expandedCategory === categoryId) {
      setExpandedCategory(null);
      setIsAnimating(false);
      return;
    }

    // First collapse any expanded category
    setExpandedCategory(null);
    
    // Wait for collapse animation to complete
    await new Promise(resolve => setTimeout(resolve, 200));
    
    // Then expand the new category
    setExpandedCategory(categoryId);
    
    // Wait for DOM update and expansion animation to start
    await new Promise(resolve => setTimeout(resolve, 50));
    
    // Calculate scroll position with offset
    const element = categoryRefs.current[categoryId];
    if (element) {
      const headerOffset = 96; // Header height
      const buffer = 24; // Additional spacing
      const elementRect = element.getBoundingClientRect();
      const absoluteElementTop = elementRect.top + window.pageYOffset;
      const middle = window.innerHeight / 4;
      const scrollTo = absoluteElementTop - headerOffset - buffer - middle;

      window.scrollTo({
        top: Math.max(0, scrollTo), // Prevent negative scroll
        behavior: 'smooth'
      });
    }
    
    // Reset animation state after everything completes
    setTimeout(() => {
      setIsAnimating(false);
    }, 500); // Increased duration to account for scroll
  };

  const getTotalProducts = () => {
    return Object.values(selection).reduce(
      (total, category) => total + Object.values(category).reduce((sum, count) => sum + count, 0),
      0
    );
  };

  const handleNext = () => {
    const formattedProducts = Object.entries(selection).flatMap(([categoryId, products]) =>
      Object.entries(products)
        .filter(([_, count]) => count > 0)
        .map(([productId, count]) => {
          const category = categories.find(c => c.id === parseInt(categoryId));
          const product = categoryProducts[parseInt(categoryId)]?.find(p => p.id === parseInt(productId));
          return {
            category: category?.Title || '',
            name: product?.attributes?.Name || '',
            quantity: count
          };
        })
    );

    console.log('Products being saved:', formattedProducts);

    updateState({
      products: formattedProducts
    });
    nextStep();
  };

  if (isLoading) {
    return (
      <FunnelStep
        title="Wählen Sie Ihre Produkte"
        subtitle="Laden..."
        currentStep={currentStep}
        totalSteps={5}
      >
        <div className="animate-pulse space-y-4">
          {[1, 2, 3].map((i) => (
            <div key={i} className="h-24 bg-gray-200 rounded-lg" />
          ))}
        </div>
      </FunnelStep>
    );
  }

  console.log('[ProductSelection] Raw category data:', categories.map(cat => ({
    id: cat.id,
    Title: cat.Title,
    ShortDescription: cat.ShortDescription,
    Description: cat.Description
  })));

  return (
    <FunnelStep
      title="Wählen Sie Ihre Produkte"
      subtitle="Klicken Sie auf die gewünschten Kategorien, um Produkte auszuwählen"
      onNext={handleNext}
      isValid={getTotalProducts() > 0}
      currentStep={currentStep}
      totalSteps={5}
    >
      <div className="pb-24">
        <div className="space-y-6">
          {categories.map((category) => (
            <div 
              key={category.id} 
              className="space-y-4"
              ref={el => categoryRefs.current[category.id] = el}
            >
              <button
                onClick={() => handleCategoryClick(category.id, category.slug)}
                className={`w-full bg-white rounded-lg shadow-sm hover:shadow-md transition-all duration-300 p-3 group ${
                  expandedCategory === category.id ? 'ring-2 ring-tuscher-blue ring-opacity-50' : ''
                }`}
              >
                <div className="flex items-center justify-between gap-3">
                  <div className="flex items-center gap-3">
                    {category.Image?.data?.[0]?.attributes?.url && (
                      <div className="relative w-14 h-14 rounded-lg overflow-hidden flex-shrink-0">
                        <Image
                          src={getImageUrl(category.Image.data[0].attributes.url)}
                          alt={category.Title || ''}
                          fill
                          className="object-cover transition-transform duration-300 group-hover:scale-105"
                        />
                      </div>
                    )}
                    <div className="text-left flex-1 min-w-0">
                      <h3 className="font-medium text-base text-tuscher-blue mb-1 truncate">
                        {category.Title}
                      </h3>
                     
                    </div>
                  </div>
                  <div className="flex items-center gap-2 flex-shrink-0">
                    {Object.values(selection[category.id] || {}).reduce(
                      (sum, count) => sum + count, 0
                    ) > 0 && (
                      <span className="text-sm px-2.5 py-1 rounded-full bg-tuscher-blue bg-opacity-10 text-tuscher-blue font-medium">
                        {Object.values(selection[category.id] || {}).reduce(
                          (sum, count) => sum + count, 0
                        )}
                      </span>
                    )}
                    <ChevronDownIcon 
                      className={`w-4 h-4 text-gray-400 transform transition-transform duration-300 ${
                        expandedCategory === category.id ? 'rotate-180' : ''
                      }`}
                    />
                  </div>
                </div>
              </button>

              <AnimatePresence mode="wait">
                {expandedCategory === category.id && categoryProducts[category.id] && (
                  <motion.div
                    key={`category-${category.id}`}
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ 
                      height: 'auto', 
                      opacity: 1,
                      transition: {
                        height: { duration: 0.3, ease: [0.4, 0, 0.2, 1] },
                        opacity: { duration: 0.2, delay: 0.1 }
                      }
                    }}
                    exit={{ 
                      height: 0, 
                      opacity: 0,
                      transition: {
                        height: { duration: 0.2, ease: [0.4, 0, 0.2, 1] },
                        opacity: { duration: 0.1 }
                      }
                    }}
                    className="overflow-hidden"
                  >
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 px-3 py-2">
                      {categoryProducts[category.id].map((product) => (
                        <motion.div
                          key={product.id}
                          initial={{ y: 20, opacity: 0 }}
                          animate={{ 
                            y: 0, 
                            opacity: 1,
                            transition: {
                              duration: 0.3,
                              ease: 'easeOut'
                            }
                          }}
                          className="relative min-h-[120px] rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all duration-300 group bg-white"
                        >
                          <div className="flex h-full">
                            <div className="relative w-28 flex-shrink-0">
                              {product.attributes.MainImage?.data?.attributes?.url ? (
                                <Image
                                  src={getImageUrl(product.attributes.MainImage.data.attributes.url)}
                                  alt={product.attributes.Name}
                                  fill
                                  className="object-cover"
                                  sizes="96px"
                                />
                              ) : (
                                <div className="w-full h-full bg-gray-100 flex items-center justify-center">
                                  <span className="text-gray-400 text-xs">Kein Bild</span>
                                </div>
                              )}
                            </div>

                            <div className="flex-1 p-3 flex flex-col min-w-0">
                              <div className="flex-grow">
                                <h4 className="text-sm font-medium text-gray-900 mb-1">
                                  {product.attributes.Name}
                                </h4>
                                <p className="text-xs text-gray-600 leading-relaxed">
                                  {product.attributes.ShortDescription}
                                </p>
                              </div>

                              <div className="flex items-center justify-end pt-2 mt-auto border-t border-gray-100">
                                <div className="inline-flex items-center bg-gray-50 rounded-full overflow-hidden border border-gray-200">
                                  <button
                                    onClick={(e) => {
                                      e.stopPropagation();
                                      const currentCount = selection[category.id]?.[product.id] || 0;
                                      if (currentCount > 0) {
                                        setSelection((prev) => ({
                                          ...prev,
                                          [category.id]: {
                                            ...(prev[category.id] || {}),
                                            [product.id]: currentCount - 1,
                                          },
                                        }));
                                      }
                                    }}
                                    className="w-6 h-6 flex items-center justify-center hover:bg-gray-100 text-gray-600 transition-colors"
                                  >
                                    <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M20 12H4" />
                                    </svg>
                                  </button>
                                  <span className="w-8 text-center text-xs font-medium text-gray-700">
                                    {selection[category.id]?.[product.id] || 0}
                                  </span>
                                  <button
                                    onClick={(e) => {
                                      e.stopPropagation();
                                      const currentCount = selection[category.id]?.[product.id] || 0;
                                      setSelection((prev) => ({
                                        ...prev,
                                        [category.id]: {
                                          ...(prev[category.id] || {}),
                                          [product.id]: currentCount + 1,
                                        },
                                      }));
                                    }}
                                    className="w-6 h-6 flex items-center justify-center hover:bg-gray-100 text-gray-600 transition-colors"
                                  >
                                    <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 4v16m8-8H4" />
                                    </svg>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </motion.div>
                      ))}
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          ))}
        </div>

        {getTotalProducts() > 0 && (
          <div className="mt-8 p-6 bg-gray-50 rounded-lg border border-gray-100">
            <h4 className="font-semibold text-lg text-tuscher-blue mb-4">Ihre Auswahl:</h4>
            <ul className="space-y-3">
              {Object.entries(selection).map(([categoryIdStr, products]) => {
                const categoryId = parseInt(categoryIdStr);
                const category = categories.find((c) => c.id === categoryId);
                const productCounts = Object.entries(products).filter(([_, count]) => count > 0);

                if (productCounts.length === 0) return null;

                return (
                  <li key={categoryId} className="pb-3 border-b border-gray-100 last:border-0">
                    <strong className="text-gray-700">{category?.Title}:</strong>
                    <div className="mt-1 flex flex-wrap gap-2">
                      {productCounts.map(([productIdStr, count]) => {
                        const productId = parseInt(productIdStr);
                        const product = categoryProducts[categoryId]?.find(
                          (p) => p.id === productId
                        );
                        return (
                          <span
                            key={productId}
                            className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600"
                          >
                            {product?.attributes.Name} ({count}x)
                          </span>
                        );
                      })}
                    </div>
                  </li>
                );
              })}
            </ul>
          </div>
        )}
      </div>
    </FunnelStep>
  );
};

export default ProductSelectionStep;
