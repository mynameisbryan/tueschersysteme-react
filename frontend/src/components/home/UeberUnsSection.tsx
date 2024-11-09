import { fetchAPI } from '@/utils/api';
import { UeberUnsData } from '@/types/content';
import { StrapiError, StrapiResponse } from '@/types/strapi';

async function getUeberUnsContent(page = 1, pageSize = 25): Promise<StrapiResponse<UeberUnsData[]>> {
  try {
    const response = await fetchAPI<StrapiResponse<UeberUnsData[]>>('/api/ueber-uns-x', {
      pagination: { page, pageSize },
      populate: '*'
    });

    const transformedData: StrapiResponse<UeberUnsData[]> = {
      data: response.data.map(item => ({
        id: item.id,
        attributes: {
          documentId: (item as any).documentId,
          Title: (item as any).Title,
          Description: (item as any).Description,
          slug: (item as any).slug,
          createdAt: (item as any).createdAt,
          updatedAt: (item as any).updatedAt,
          publishedAt: (item as any).publishedAt
        }
      })),
      meta: response.meta
    };

    return transformedData;
  } catch (error) {
    console.error('Full error details:', error);
    throw error as StrapiError;
  }
}

export default async function UeberUnsSection() {
  try {
    const response = await getUeberUnsContent();
    console.log('Transformed response:', JSON.stringify(response, null, 2));

    if (!response?.data || response.data.length === 0) {
      return (
        <section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <h2 className="text-3xl font-bold text-center mb-12">Über Uns</h2>
            <p className="text-center">Keine Inhalte verfügbar.</p>
          </div>
        </section>
      );
    }

    return (
      <section className="section bg-white">
        <div className="container-padding">
          <h2 className="section-title">Ihre Vorteile mit Tüscher Systeme</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {response.data.map((item) => {
              const { Title = 'Untitled', Description = '', slug = '#' } = item.attributes || {};

              return (
                <article key={item.id} className="card card-hover">
                  <div className="p-6 space-y-4">
                    <div className="flex items-center gap-4">
                      <span className="flex-shrink-0 w-12 h-12 flex items-center justify-center 
                                   rounded-full bg-tuscher-blue/10">
                        <svg 
                          className="w-6 h-6 text-tuscher-blue" 
                          fill="none" 
                          stroke="currentColor" 
                          viewBox="0 0 24 24"
                        >
                          <path 
                            strokeLinecap="round" 
                            strokeLinejoin="round" 
                            strokeWidth="2" 
                            d="M5 13l4 4L19 7"
                          />
                        </svg>
                      </span>
                      <h3 className="text-xl font-semibold text-tuscher-blue">{Title}</h3>
                    </div>
                    <p className="text-gray-600 ml-16">{Description || 'No description available'}</p>
                  </div>
                </article>
              );
            })}
          </div>
        </div>
      </section>
    );
  } catch (error) {
    console.error('Error in UeberUnsSection:', error);
    return (
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Über Uns</h2>
          <p className="text-center text-red-600">Fehler beim Laden der Inhalte.</p>
        </div>
      </section>
    );
  }
} 