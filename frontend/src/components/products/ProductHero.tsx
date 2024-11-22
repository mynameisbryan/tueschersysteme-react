'use client';

import Image from 'next/image';
import { getImageUrl } from '@/utils/api';
import { ArrowDownIcon } from '@heroicons/react/24/outline';

interface ProductHeroProps {
  title: string;
  description: string;
  image?: string;
  altText?: string;
}

export default function ProductHero({ title, description, image, altText = title }: ProductHeroProps) {
  const imageUrl = image 
    ? getImageUrl(image)
    : '/images/fenster_auf_schlafen.jpeg';

  const scrollToProducts = () => {
    const productsSection = document.querySelector('#products');
    productsSection?.scrollIntoView({ behavior: 'smooth' });
  };

  return (
    <section className="relative h-[50vh] min-h-[300px] md:h-[60vh] md:min-h-[400px] bg-gray-900">
      <div className="absolute inset-0">
        <Image
          src={imageUrl}
          alt={altText}
          fill
          sizes="100vw"
          className="object-cover"
          priority
        />
        <div className="absolute inset-0 bg-gradient-to-b from-black/80 via-black/50 to-black/80" />
      </div>
      
      <div className="relative h-full container mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col items-center justify-end md:justify-center h-full text-center pb-16 md:pb-0">
          <h1 className="text-2xl sm:text-3xl lg:text-5xl font-bold text-white mb-2 sm:mb-4 leading-tight">
            {title}
          </h1>
          <p className="text-base sm:text-lg lg:text-xl text-gray-200 mb-6 max-w-2xl">
            {description}
          </p>
          <button
            onClick={scrollToProducts}
            className="group inline-flex items-center gap-2 bg-white/10 hover:bg-white/20 
                     text-white px-4 sm:px-6 py-2 sm:py-3 rounded-full transition-all 
                     duration-300 backdrop-blur-sm text-sm sm:text-base"
          >
            Produkte entdecken
            <ArrowDownIcon className="w-4 h-4 sm:w-5 sm:h-5 group-hover:translate-y-1 transition-transform duration-300" />
          </button>
        </div>
      </div>
    </section>
  );
} 