import { default as NextImage } from 'next/image';
import { cn } from '@/utils/cn';

interface ProductCardProps {
  title: string;
  description: string;
  imageUrl: string | null;
  imageAlt: string;
  features: string[];
  category: string;
}

export default function ProductCard({ 
  title, 
  description, 
  imageUrl, 
  imageAlt,
  features,
  category,
}: ProductCardProps) {
  // Debug log
  console.log('[ProductCard] Rendering:', {
    title,
    hasImage: !!imageUrl,
    imageUrl,
    features
  });

  return (
    <div 
      role="article"
      tabIndex={0}
      className="group cursor-pointer bg-white rounded-xl shadow-sm hover:shadow-md transition-all duration-300 focus:outline-none focus:ring-2 focus:ring-tuscher-blue focus:ring-offset-2"
    >
      <div className="relative aspect-[4/3] overflow-hidden rounded-t-xl bg-gray-100">
        {imageUrl ? (
          <NextImage
            src={imageUrl}
            alt={imageAlt}
            fill
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
            className="object-cover transition-transform duration-300 group-hover:scale-105"
            priority={false}
            quality={75}
          />
        ) : (
          <div className="w-full h-full flex items-center justify-center">
            <div className="text-gray-400">
              Kein Bild verfügbar
            </div>
          </div>
        )}
        
      
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