import { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { getImageUrl } from '@/utils/api';
import { WelcomeSectionData } from '@/types/content';
import Image from 'next/image';
import Markdown from 'markdown-to-jsx';
import qs from 'qs';
import Button from '@/components/ui/Button';
import Link from 'next/link';
import CategoryCTA from '@/components/ui/CategoryCTA';

async function loadWelcomeContent(): Promise<{ data: WelcomeSectionData } | null> {
  try {
    const response = await fetch(`${process.env.NEXT_PUBLIC_STRAPI_API_URL}/api/welcome-section?populate=*`);
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('[Welcome] Error fetching content:', error);
    return null;
  }
}

export default async function WelcomeSection() {
  const welcomeContent = await loadWelcomeContent();

  if (!welcomeContent?.data) {
    return null;
  }

  const {
    Title,
    Paragraphs,
    Catchheader,
    Catchtext,
    Catchimage,
    CTAText,
    NeherLogo,
  } = welcomeContent.data;

  const imageUrl = Catchimage?.url ||
                  Catchimage?.formats?.large?.url ||
                  Catchimage?.formats?.medium?.url ||
                  Catchimage?.formats?.small?.url ||
                  '';
  
  const imageUrlLogo = NeherLogo?.url ||
                      NeherLogo?.formats?.large?.url ||
                      NeherLogo?.formats?.medium?.url ||
                      NeherLogo?.formats?.small?.url ||
                      '';

  console.log('[Welcome] NeherLogo:', NeherLogo);
  console.log('[Welcome] imageUrlLogo before getImageUrl:', imageUrlLogo);
  console.log('[Welcome] imageUrlLogo after getImageUrl:', getImageUrl(imageUrlLogo));

  return (
    <section className="section bg-white">
      <div className="container-padding">
        <div className="flex flex-col lg:flex-row items-start gap-8 md:gap-12">
          {/* Left side - Main content */}
          <motion.div 
            className="flex-1 space-y-6"
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5 }}
          >
            <h2 className="text-3xl md:text-4xl font-bold text-tuscher-blue leading-tight">
              {Title}
            </h2>
            <div className="space-y-4 text-gray-600/90 relative">
              <div className="relative">
                <Markdown
                  options={{
                    wrapper: 'div',
                    forceWrapper: true,
                    forceBlock: true,
                  }}
                  className="space-y-4 text-base md:text-lg leading-relaxed"
                >
                  {Paragraphs}
                </Markdown>
                {imageUrlLogo && (
                  <div className="relative w-24 h-12 float-right ml-4 mb-4">
                    <Image
                      src={getImageUrl(imageUrlLogo)}
                      alt="Neher Logo"
                      fill
                      className="object-contain"
                      sizes="96px"
                      style={{ shapeOutside: 'content-box' }}
                    />
                  </div>
                )}
              </div>
            </div>
          </motion.div>

          {/* Right side - Card with Image and Text */}
          <div className="flex-1">
            <div className="card overflow-hidden rounded-xl bg-white shadow-lg 
                            transition-all duration-300 hover:shadow-xl hover:-translate-y-1">
              {/* Image Container */}
              {imageUrl && (
                <div className="relative aspect-[16/9] overflow-hidden">
                  <div className="absolute inset-0 bg-gradient-to-t from-[var(--color-navy)]/10 to-transparent z-10" />
                  <Image
                    src={getImageUrl(imageUrl)}
                    alt="Welcome Illustration"
                    fill
                    className="object-cover transition-transform duration-500 
                             group-hover:scale-105"
                    sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 500px"
                    priority
                    quality={85}
                  />
                </div>
              )}
              
              {/* Text Content */}
              <div className="p-8">
                <h3 className="text-2xl font-bold text-[var(--color-navy)] mb-4 
                               transition-colors duration-300 group-hover:text-tuscher-blue">
                  {Catchheader}
                </h3>
                <p className="text-gray-600 mb-6 leading-relaxed">
                  {Catchtext}
                </p>
                {CTAText && (
                  <CategoryCTA 
                    href="/salesfunnel" 
                    className="w-full mt-6"
                  >
                    {CTAText}
                  </CategoryCTA>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
