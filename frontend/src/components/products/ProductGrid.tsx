import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { getImageUrl } from '@/utils/api';
import ProductCard from './ProductCard';

interface ProductGridProps {
  products: Array<{
    id: number;
    attributes: {
      Name: string;
      ShortDescription: string;
      MainImage?: {
        data?: {
          attributes?: {
            url?: string;
          };
        };
      };
      Features?: string[];
    };
  }>;
  activeCategory: string;
}

// Define animations outside component to prevent recreation
const containerVariants = {
  hidden: { opacity: 0 },
  visible: { 
    opacity: 1,
    transition: { staggerChildren: 0.1 }
  }
};

const itemVariants = {
  hidden: { opacity: 0, y: 20 },
  visible: { opacity: 1, y: 0 }
};

export default function ProductGrid({ products, activeCategory }: ProductGridProps) {
  const [filteredProducts, setFilteredProducts] = useState(products);

  useEffect(() => {
    setFilteredProducts(products);
  }, [products, activeCategory]);

  if (!products?.length) {
    return (
      <div className="text-center py-12">
        <p className="text-gray-600">Keine Produkte verfügbar.</p>
      </div>
    );
  }

  return (
    <motion.section 
      className="py-12"
      initial="hidden"
      animate="visible"
      variants={containerVariants}
    >
      <div className="container mx-auto px-4">
        <motion.div 
          className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"
        >
          {filteredProducts.map((product) => (
            <motion.div
              key={product.id}
              variants={itemVariants}
              layout
            >
              <ProductCard
                title={product.attributes.Name}
                description={product.attributes.ShortDescription}
                image={product.attributes.MainImage?.data?.attributes?.url 
                  ? getImageUrl(product.attributes.MainImage.data.attributes.url)
                  : undefined}
                features={product.attributes.Features || []}
                category={activeCategory}
              />
            </motion.div>
          ))}
        </motion.div>
      </div>
    </motion.section>
  );
} 