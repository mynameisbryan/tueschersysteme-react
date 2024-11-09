import { getImageUrl } from '@/utils/api';
import { FileResourceData } from '@/types/common';

interface InfoSectionProps {
  resources: FileResourceData[];
}

export default function InfoSection({ resources = [] }: InfoSectionProps) {
  const formatFileSize = (size?: number): string => {
    if (!size) return '0 MB';
    return `${(size / 1024 / 1024).toFixed(1)} MB`;
  };

  return (
    <section className="py-16 bg-gray-50">
      <div className="container">
        <div className="grid md:grid-cols-2 gap-12">
          {/* Weitere Infos */}
          <div>
            <h2 className="text-2xl font-bold text-tuscher-blue mb-6">
              Weitere Infos
            </h2>
            <div className="prose prose-tuscher max-w-none">
              <p>
                Unsere Produkte werden nach höchsten Qualitätsstandards gefertigt 
                und bieten Ihnen langlebige Lösungen für Ihr Zuhause.
              </p>
              <ul className="mt-4 space-y-2">
                <li>Maßgefertigte Lösungen</li>
                <li>Professionelle Beratung</li>
                <li>Fachgerechte Montage</li>
                <li>Langjährige Garantie</li>
              </ul>
            </div>
          </div>

          {/* Downloads */}
          <div>
            <h2 className="text-2xl font-bold text-tuscher-blue mb-6">
              Downloads
            </h2>
            {resources.length === 0 ? (
              <p className="text-gray-600">Keine Downloads verfügbar.</p>
            ) : (
              <div className="space-y-4">
                {resources.map((resource) => (
                  <a
                    key={resource.id}
                    href={getImageUrl(resource.attributes.url)}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center p-4 bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow"
                  >
                    <svg 
                      className="w-8 h-8 text-tuscher-blue mr-4" 
                      fill="none" 
                      stroke="currentColor" 
                      viewBox="0 0 24 24"
                    >
                      <path 
                        strokeLinecap="round" 
                        strokeLinejoin="round" 
                        strokeWidth="2" 
                        d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                      />
                    </svg>
                    <div>
                      <h3 className="font-medium text-tuscher-blue">
                        {resource.attributes.name}
                      </h3>
                      <p className="text-sm text-gray-500">
                        {resource.attributes.formats?.thumbnail ? 'PDF' : 'File'}
                      </p>
                    </div>
                  </a>
                ))}
              </div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
} 