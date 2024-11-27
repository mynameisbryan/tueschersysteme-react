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
// src/components/home/ProductCategories.tsx
var image_1 = require("next/image");
var link_1 = require("next/link");
var api_1 = require("@/utils/api");
var CategoryCTA_1 = require("@/components/ui/CategoryCTA");
function getProductCategories(page, pageSize) {
    if (page === void 0) { page = 1; }
    if (pageSize === void 0) { pageSize = 9; }
    return __awaiter(this, void 0, void 0, function () {
        var response, transformedData, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, (0, api_1.fetchAPI)('/api/product-categories', {
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
                                Image: {
                                    data: Array.isArray(item.Image)
                                        ? item.Image.map(function (img) { return ({
                                            id: img.id,
                                            attributes: {
                                                url: img.url,
                                                alternativeText: img.alternativeText || '',
                                                width: img.width,
                                                height: img.height,
                                                formats: img.formats || {}
                                            }
                                        }); })
                                        : []
                                },
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
function ProductCategories() {
    return __awaiter(this, void 0, void 0, function () {
        var response, error_2;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    return [4 /*yield*/, getProductCategories()];
                case 1:
                    response = _a.sent();
                    console.log('Transformed response:', JSON.stringify(response, null, 2));
                    if (!(response === null || response === void 0 ? void 0 : response.data) || response.data.length === 0) {
                        return [2 /*return*/, (<section className="py-16 bg-gray-100">
          <div className="container mx-auto px-4">
            <h2 className="text-3xl font-bold text-center mb-12">Produktkategorien</h2>
            <p className="text-center">Keine Kategorien verfügbar.</p>
          </div>
        </section>)];
                    }
                    return [2 /*return*/, (<section id="products-section" className="section bg-white">
        <div className="container">
          <h2 className="section-title">Unsere Produkte</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8">
            {response.data.map(function (category) {
                                var _a, _b;
                                var _c = category.attributes || {}, _d = _c.Title, Title = _d === void 0 ? 'Untitled' : _d, _e = _c.Description, Description = _e === void 0 ? '' : _e, _f = _c.slug, slug = _f === void 0 ? '#' : _f, Image = _c.Image;
                                var imageData = (_b = (_a = Image === null || Image === void 0 ? void 0 : Image.data) === null || _a === void 0 ? void 0 : _a[0]) === null || _b === void 0 ? void 0 : _b.attributes;
                                var imageUrl = imageData === null || imageData === void 0 ? void 0 : imageData.url;
                                var altText = (imageData === null || imageData === void 0 ? void 0 : imageData.alternativeText) || Title;
                                return (<link_1.default key={category.id} href={"/products?category=".concat(slug)} className="card card-hover group">
                  <div className="relative aspect-[16/9] overflow-hidden">
                    <image_1.default src={(0, api_1.getImageUrl)(imageUrl)} alt={altText} fill className="object-cover transition-transform duration-300 
                               group-hover:scale-105"/>
                  </div>
                  <div className="p-6">
                    <h3 className="text-xl font-bold text-tuscher-blue mb-2">
                      {Title}
                    </h3>
                    <p className="text-tuscher-blue/70 mb-4">
                      {Description}
                    </p>
                    <div className="flex flex-col space-y-4">
                      <CategoryCTA_1.default href={"/products?category=".concat(slug)}>
                        Produkte entdecken
                      </CategoryCTA_1.default>
                    </div>
                  </div>
                </link_1.default>);
                            })}
          </div>
        </div>
      </section>)];
                case 2:
                    error_2 = _a.sent();
                    console.error('Error in ProductCategories:', error_2);
                    return [2 /*return*/, (<section className="py-16 bg-gray-100">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Produktkategorien</h2>
          <p className="text-center text-red-600">Fehler beim Laden der Kategorien.</p>
        </div>
      </section>)];
                case 3: return [2 /*return*/];
            }
        });
    });
}
exports.default = ProductCategories;
