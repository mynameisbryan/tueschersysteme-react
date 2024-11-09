'use client';

import Image from 'next/image';
import { getStrapiMediaUrl } from '@/utils/api';

interface HeroBackgroundImageProps {
  imageUrl: string;
}

export default function HeroBackgroundImage({ imageUrl }: HeroBackgroundImageProps) {
  return (
    <div className="absolute inset-0">
      <Image
        src={getStrapiMediaUrl(imageUrl)}
        alt="Hero Background"
        fill
        priority
        sizes="100vw"
        className="object-cover object-center"
        quality={100}
        onError={(e) => {
          console.error('Image failed to load:', {
            src: e.currentTarget.src,
            error: e,
            originalUrl: imageUrl,
            constructedUrl: getStrapiMediaUrl(imageUrl)
          });
        }}
        placeholder="blur"
        blurDataURL={`data:image/svg+xml;base64,${Buffer.from(
          '<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 1 1"><rect width="1" height="1" fill="#1E3A8A"/></svg>'
        ).toString('base64')}`}
      />
    </div>
  );
} 