'use client';

import Image from 'next/image';
import { getImageUrl } from '@/utils/api';

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

  return (
    <section className="relative h-[50vh] min-h-[400px] bg-gray-900">
      <div className="absolute inset-0">
        <Image
          src={imageUrl}
          alt={altText}
          fill
          sizes="100vw"
          className="object-cover"
          priority
        />
        <div className="absolute inset-0 bg-black/50" />
      </div>
      
      <div className="container relative h-full py-12">
        <div className="flex flex-col justify-center h-full max-w-2xl">
          <h1 className="text-4xl font-bold text-white mb-4">
            {title}
          </h1>
          <p className="text-xl text-gray-200">
            {description}
          </p>
        </div>
      </div>
    </section>
  );
} 