"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var api_1 = require("@/utils/api");
function InfoSection(_a) {
    var _b = _a.resources, resources = _b === void 0 ? [] : _b;
    var formatFileSize = function (size) {
        if (!size)
            return '0 MB';
        return "".concat((size / 1024 / 1024).toFixed(1), " MB");
    };
    return (<section className="py-16 bg-gray-50">
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
            {resources.length === 0 ? (<p className="text-gray-600">Keine Downloads verfügbar.</p>) : (<div className="space-y-4">
                {resources.map(function (resource) {
                var _a;
                return (<a key={resource.id} href={(0, api_1.getImageUrl)(resource.attributes.url)} target="_blank" rel="noopener noreferrer" className="flex items-center p-4 bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow">
                    <svg className="w-8 h-8 text-tuscher-blue mr-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    <div>
                      <h3 className="font-medium text-tuscher-blue">
                        {resource.attributes.name}
                      </h3>
                      <p className="text-sm text-gray-500">
                        {((_a = resource.attributes.formats) === null || _a === void 0 ? void 0 : _a.thumbnail) ? 'PDF' : 'File'}
                      </p>
                    </div>
                  </a>);
            })}
              </div>)}
          </div>
        </div>
      </div>
    </section>);
}
exports.default = InfoSection;
