import Image from 'next/image';
import { cn } from '@/utils/cn';

interface ProductCardProps {
  title: string;
  description: string;
  image?: string;
  features: string[];
  category: string;
  onClick?: () => void;
}

export default function ProductCard({ 
  title, 
  description, 
  image = '/images/placeholder.jpg', 
  features,
  category,
  onClick 
}: ProductCardProps) {
  return (
    <div 
      onClick={onClick}
      className="group cursor-pointer bg-white rounded-xl shadow-sm hover:shadow-md transition-all duration-300"
    >
      <div className="relative aspect-[4/3] overflow-hidden rounded-t-xl">
        <Image
          src={image}
          alt={title}
          fill
          className="object-cover transition-transform duration-300 group-hover:scale-105"
        />
        <div className="absolute top-4 right-4">
          <span className="px-3 py-1 text-sm bg-tuscher-blue/90 text-white rounded-full">
            {category}
          </span>
        </div>
      </div>
      
      <div className="p-6">
        <h3 className="text-xl font-semibold text-gray-900 mb-2">
          {title}
        </h3>
        <p className="text-gray-600 mb-4 line-clamp-2">
          {description}
        </p>
        
        {features?.length > 0 && (
          <ul className="space-y-2">
            {features.slice(0, 3).map((feature, index) => (
              <li key={index} className="flex items-center text-sm text-gray-600">
                <span className="w-1.5 h-1.5 bg-tuscher-blue rounded-full mr-2" />
                {feature}
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
} 