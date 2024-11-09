import { fetchAPI, getStrapiMediaUrl } from '@/utils/api';
import { WelcomeSectionData } from '@/types/content';
import Image from 'next/image';
import Markdown from 'markdown-to-jsx';
import qs from 'qs';

async function getWelcomeContent(): Promise<{ data: WelcomeSectionData } | null> {
  try {
    const query = qs.stringify(
      {
        populate: '*'
      },
      {
        encodeValuesOnly: true
      }
    );

    console.log('[Welcome] Fetching with query:', `/api/welcome-section?${query}`);
    
    const response = await fetchAPI<{ data: WelcomeSectionData }>(
      `/api/welcome-section?${query}`
    );

    if (!response?.data) {
      console.error('[Welcome] Invalid welcome content structure:', response);
      return null;
    }

    return response;
  } catch (error) {
    console.error('[Welcome] Error fetching content:', error);
    return null;
  }
}

export default async function WelcomeSection() {
  const welcomeContent = await getWelcomeContent();

  if (!welcomeContent?.data) {
    console.warn('[Welcome] No content available');
    return null;
  }

  const {
    Title,
    Paragraphs,
    Catchheader,
    Catchtext,
    Catchimage,
  } = welcomeContent.data;

  const imageUrl = Catchimage?.url ||
                  Catchimage?.formats?.large?.url ||
                  Catchimage?.formats?.medium?.url ||
                  Catchimage?.formats?.small?.url ||
                  '';

  return (
    <section className="section bg-white">
      <div className="container-padding">
        <div className="flex flex-col lg:flex-row items-start gap-8 md:gap-12">
          {/* Left side - Main content */}
          <div className="flex-1 space-y-6">
            <h2 className="text-3xl md:text-4xl font-bold text-tuscher-blue leading-tight">
              {Title}
            </h2>
            <div className="space-y-4 text-gray-600/90">
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
            </div>
          </div>

          {/* Right side - Card with Image and Text */}
          <div className="flex-1">
            <div className="card card-hover group">
              {/* Image Container */}
              {imageUrl && (
                <div className="relative aspect-[16/9] overflow-hidden">
                  <Image
                    src={getStrapiMediaUrl(imageUrl)}
                    alt="Welcome Illustration"
                    fill
                    className="object-cover transition-transform duration-300 
                             group-hover:scale-105"
                    sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 500px"
                    priority
                    quality={85}
                  />
                </div>
              )}
              
              {/* Text Content */}
              <div className="p-6">
                <h3 className="text-xl font-bold text-tuscher-blue mb-2">
                  {Catchheader}
                </h3>
                <p className="text-tuscher-blue/70">
                  {Catchtext}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
