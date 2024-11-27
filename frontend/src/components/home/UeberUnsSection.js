"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var api_1 = require("@/utils/api");
function getUeberUnsContent(page, pageSize) {
    if (page === void 0) { page = 1; }
    if (pageSize === void 0) { pageSize = 25; }
    return __awaiter(this, void 0, void 0, function () {
        var response, transformedData, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, (0, api_1.fetchAPI)('/api/ueber-uns-x', {
                            pagination: { page: page, pageSize: pageSize },
                            populate: '*'
                        })];
                case 1:
                    response = _a.sent();
                    transformedData = {
                        data: response.data.map(function (item) { return ({
                            id: item.id,
                            attributes: {
                                documentId: item.documentId,
                                Title: item.Title,
                                Description: item.Description,
                                slug: item.slug,
                                createdAt: item.createdAt,
                                updatedAt: item.updatedAt,
                                publishedAt: item.publishedAt
                            }
                        }); }),
                        meta: response.meta
                    };
                    return [2 /*return*/, transformedData];
                case 2:
                    error_1 = _a.sent();
                    console.error('Full error details:', error_1);
                    throw error_1;
                case 3: return [2 /*return*/];
            }
        });
    });
}
function UeberUnsSection() {
    return __awaiter(this, void 0, void 0, function () {
        var response, error_2;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, getUeberUnsContent()];
                case 1:
                    response = _a.sent();
                    console.log('Transformed response:', JSON.stringify(response, null, 2));
                    if (!(response === null || response === void 0 ? void 0 : response.data) || response.data.length === 0) {
                        return [2 /*return*/, (<section className="py-16 bg-white">
          <div className="container mx-auto px-4">
            <h2 className="text-3xl font-bold text-center mb-12">Über Uns</h2>
            <p className="text-center">Keine Inhalte verfügbar.</p>
          </div>
        </section>)];
                    }
                    return [2 /*return*/, (<section className="section bg-white">
        <div className="container-padding">
          <h2 className="section-title">Ihre Vorteile mit Tüscher Systeme</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {response.data.map(function (item) {
                                var _a = item.attributes || {}, _b = _a.Title, Title = _b === void 0 ? 'Untitled' : _b, _c = _a.Description, Description = _c === void 0 ? '' : _c, _d = _a.slug, slug = _d === void 0 ? '#' : _d;
                                return (<article key={item.id} className="card card-hover">
                  <div className="p-6 space-y-4">
                    <div className="flex items-center gap-4">
                      <span className="flex-shrink-0 w-12 h-12 flex items-center justify-center 
                                   rounded-full bg-tuscher-blue/10">
                        <svg className="w-6 h-6 text-tuscher-blue" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7"/>
                        </svg>
                      </span>
                      <h3 className="text-xl font-semibold text-tuscher-blue">{Title}</h3>
                    </div>
                    <p className="text-gray-600 ml-16">{Description || 'No description available'}</p>
                  </div>
                </article>);
                            })}
          </div>
        </div>
      </section>)];
                case 2:
                    error_2 = _a.sent();
                    console.error('Error in UeberUnsSection:', error_2);
                    return [2 /*return*/, (<section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Über Uns</h2>
          <p className="text-center text-red-600">Fehler beim Laden der Inhalte.</p>
        </div>
      </section>)];
                case 3: return [2 /*return*/];
            }
        });
    });
}
exports.default = UeberUnsSection;
