import { fetchAPI, getStrapiMediaUrl } from '@/utils/api';
import { HeroSectionData } from '@/types/content';
import Link from 'next/link';
import qs from 'qs';
import FeatureItem from '../home/FeatureItem';
import HeroBackgroundImage from './HeroBackgroundImage';

async function getHeroContent(): Promise<{ data: HeroSectionData } | null> {
  try {
    const query = qs.stringify(
      {
        populate: '*'
      },
      {
        encodeValuesOnly: true
      }
    );

    console.log('[Hero] Fetching with query:', `/api/hero-section?${query}`);
    
    const response = await fetchAPI<{ data: HeroSectionData }>(
      `/api/hero-section?${query}`
    );

    if (!response?.data) {
      console.error('[Hero] Invalid hero content structure:', response);
      return null;
    }

    return response;
  } catch (error) {
    console.error('[Hero] Error fetching content:', error);
    return null;
  }
}

export default async function HeroSection() {
  const heroContent = await getHeroContent();

  if (!heroContent?.data) {
    console.error('[Hero] No content available');
    return (
      <section className="relative h-[70vh] mt-20 bg-tuscher-blue">
        <div className="container mx-auto px-4">
          <p className="text-white text-center">Failed to load hero content.</p>
        </div>
      </section>
    );
  }

  const {
    Title = '',
    Description = '',
    CallToActionText = '',
    CallToActionLink = '#',
    featureitems = [],
    BackgroundImage,
  } = heroContent.data;

  const imageUrl = BackgroundImage?.url ||
                  BackgroundImage?.formats?.large?.url ||
                  BackgroundImage?.formats?.medium?.url ||
                  BackgroundImage?.formats?.small?.url ||
                  '';

  console.log('[Hero] Image URL:', imageUrl);
  if (!imageUrl) {
    console.warn('[Hero] No image URL found in:', BackgroundImage);
  }

  return (
    <section className="relative min-h-[480px] sm:min-h-[520px] md:min-h-[580px] 
                        mt-[var(--header-height)] bg-tuscher-blue">
      {/* Background Image with Overlay */}
      {imageUrl && (
        <>
          <HeroBackgroundImage imageUrl={imageUrl} />
          <div className="hero-overlay-light" />
        </>
      )}
      
      {/* Content Container */}
      <div className="container relative h-full py-6 sm:py-8 md:py-12">
        <div className="flex flex-col lg:flex-row items-start lg:items-center 
                      justify-between h-full gap-6 sm:gap-8 md:gap-12">
          {/* Left Side - Hero Content */}
          <div className="w-full lg:w-5/12 space-y-3 sm:space-y-4 md:space-y-6 pt-4 sm:pt-6">
            <h1 className="text-2xl sm:text-3xl md:text-4xl xl:text-5xl font-bold 
                         text-white leading-tight tracking-tight">
              {Title}
            </h1>
            <p className="text-base sm:text-lg text-gray-100/90 leading-relaxed max-w-xl">
              {Description}
            </p>
            <div className="flex flex-col sm:flex-row gap-3 sm:gap-4 pt-2">
              <Link href={CallToActionLink} className="btn-primary-light">
                {CallToActionText}
              </Link>
              <Link href="/contact" className="btn-outline-light">
                Kontakt
              </Link>
            </div>
          </div>
          
          {/* Right Side - Features List */}
          {featureitems.length > 0 && (
            <div className="w-full lg:w-6/12">
              <div className="glass-card p-5 sm:p-6 md:p-8">
                <h2 className="text-lg sm:text-xl md:text-2xl font-bold 
                             mb-4 sm:mb-5 md:mb-6 text-white">
                  Warum Tüscher Systeme?
                </h2>
                <ul className="space-y-3 sm:space-y-4">
                  {featureitems.map((item) => (
                    <FeatureItem 
                      key={item.id}
                      title={item.title}
                      icon={item.icon}
                    />
                  ))}
                </ul>
              </div>
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
