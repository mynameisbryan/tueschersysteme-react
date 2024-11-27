"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
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
// ProductSelectionStep.tsx
var react_1 = require("react");
var FunnelContext_1 = require("../FunnelContext");
var FunnelStep_1 = require("@/components/salesfunnel/FunnelStep");
var framer_motion_1 = require("framer-motion");
var image_1 = require("next/image");
var api_1 = require("@/utils/api");
var solid_1 = require("@heroicons/react/20/solid");
var ProductSelectionStep = function () {
    var _a = (0, FunnelContext_1.useFunnel)(), state = _a.state, updateState = _a.updateState, nextStep = _a.nextStep, currentStep = _a.currentStep;
    var _b = (0, react_1.useState)([]), categories = _b[0], setCategories = _b[1];
    var _c = (0, react_1.useState)({}), categoryProducts = _c[0], setCategoryProducts = _c[1];
    var _d = (0, react_1.useState)(function () {
        if (!state.products)
            return {};
        return state.products.reduce(function (acc, item) {
            var _a, _b;
            var _c = item.split(':'), categoryIdStr = _c[0], productIdStr = _c[1], countStr = _c[2];
            var categoryId = parseInt(categoryIdStr);
            var productId = parseInt(productIdStr);
            var count = parseInt(countStr);
            return __assign(__assign({}, acc), (_a = {}, _a[categoryId] = __assign(__assign({}, (acc[categoryId] || {})), (_b = {}, _b[productId] = count, _b)), _a));
        }, {});
    }), selection = _d[0], setSelection = _d[1];
    var _e = (0, react_1.useState)(null), expandedCategory = _e[0], setExpandedCategory = _e[1];
    var _f = (0, react_1.useState)(true), isLoading = _f[0], setIsLoading = _f[1];
    var _g = (0, react_1.useState)({}), loadingCategories = _g[0], setLoadingCategories = _g[1];
    var categoryRefs = (0, react_1.useRef)({});
    var _h = (0, react_1.useState)(false), isAnimating = _h[0], setIsAnimating = _h[1];
    (0, react_1.useEffect)(function () {
        var loadCategories = function () { return __awaiter(void 0, void 0, void 0, function () {
            var response, error_1;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        _a.trys.push([0, 4, 5, 6]);
                        return [4 /*yield*/, (0, api_1.getProductCategories)()];
                    case 1:
                        response = _a.sent();
                        setCategories(response.data);
                        if (!(response.data.length > 0)) return [3 /*break*/, 3];
                        setExpandedCategory(response.data[0].id);
                        return [4 /*yield*/, loadCategoryProducts(response.data[0].id, response.data[0].slug)];
                    case 2:
                        _a.sent();
                        _a.label = 3;
                    case 3: return [3 /*break*/, 6];
                    case 4:
                        error_1 = _a.sent();
                        console.error('Failed to load categories:', error_1);
                        return [3 /*break*/, 6];
                    case 5:
                        setIsLoading(false);
                        return [7 /*endfinally*/];
                    case 6: return [2 /*return*/];
                }
            });
        }); };
        loadCategories();
    }, []);
    var loadCategoryProducts = function (categoryId, categorySlug) { return __awaiter(void 0, void 0, void 0, function () {
        var productsResponse_1, error_2;
        var _a, _b;
        return __generator(this, function (_c) {
            switch (_c.label) {
                case 0:
                    if (categoryProducts[categoryId])
                        return [2 /*return*/];
                    setLoadingCategories(function (prev) {
                        var _a;
                        return (__assign(__assign({}, prev), (_a = {}, _a[categoryId] = true, _a)));
                    });
                    _c.label = 1;
                case 1:
                    _c.trys.push([1, 3, 4, 5]);
                    return [4 /*yield*/, (0, api_1.getCategoryProducts)(categorySlug)];
                case 2:
                    productsResponse_1 = _c.sent();
                    console.log('[ProductSelection] Products response:', {
                        categoryId: categoryId,
                        firstProduct: productsResponse_1.data[0],
                        firstProductImage: (_b = (_a = productsResponse_1.data[0]) === null || _a === void 0 ? void 0 : _a.attributes) === null || _b === void 0 ? void 0 : _b.MainImage
                    });
                    setCategoryProducts(function (prev) {
                        var _a;
                        return (__assign(__assign({}, prev), (_a = {}, _a[categoryId] = productsResponse_1.data, _a)));
                    });
                    return [3 /*break*/, 5];
                case 3:
                    error_2 = _c.sent();
                    console.error('Failed to load products:', error_2);
                    return [3 /*break*/, 5];
                case 4:
                    setLoadingCategories(function (prev) {
                        var _a;
                        return (__assign(__assign({}, prev), (_a = {}, _a[categoryId] = false, _a)));
                    });
                    return [7 /*endfinally*/];
                case 5: return [2 /*return*/];
            }
        });
    }); };
    var toggleProduct = function (categoryId, productId) {
        setSelection(function (prev) {
            var _a, _b;
            var _c;
            var currentCount = ((_c = prev[categoryId]) === null || _c === void 0 ? void 0 : _c[productId]) || 0;
            var newCount = currentCount === 0 ? 1 : 0;
            return __assign(__assign({}, prev), (_a = {}, _a[categoryId] = __assign(__assign({}, (prev[categoryId] || {})), (_b = {}, _b[productId] = newCount, _b)), _a));
        });
    };
    var handleCategoryClick = function (categoryId, categorySlug) { return __awaiter(void 0, void 0, void 0, function () {
        var element, headerOffset, buffer, elementRect, absoluteElementTop, middle, scrollTo_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (isAnimating)
                        return [2 /*return*/];
                    setIsAnimating(true);
                    if (!!categoryProducts[categoryId]) return [3 /*break*/, 2];
                    return [4 /*yield*/, loadCategoryProducts(categoryId, categorySlug)];
                case 1:
                    _a.sent();
                    _a.label = 2;
                case 2:
                    // If clicking the same category, just collapse it
                    if (expandedCategory === categoryId) {
                        setExpandedCategory(null);
                        setIsAnimating(false);
                        return [2 /*return*/];
                    }
                    // First collapse any expanded category
                    setExpandedCategory(null);
                    // Wait for collapse animation to complete
                    return [4 /*yield*/, new Promise(function (resolve) { return setTimeout(resolve, 200); })];
                case 3:
                    // Wait for collapse animation to complete
                    _a.sent();
                    // Then expand the new category
                    setExpandedCategory(categoryId);
                    // Wait for DOM update and expansion animation to start
                    return [4 /*yield*/, new Promise(function (resolve) { return setTimeout(resolve, 50); })];
                case 4:
                    // Wait for DOM update and expansion animation to start
                    _a.sent();
                    element = categoryRefs.current[categoryId];
                    if (element) {
                        headerOffset = 96;
                        buffer = 24;
                        elementRect = element.getBoundingClientRect();
                        absoluteElementTop = elementRect.top + window.pageYOffset;
                        middle = window.innerHeight / 4;
                        scrollTo_1 = absoluteElementTop - headerOffset - buffer - middle;
                        window.scrollTo({
                            top: Math.max(0, scrollTo_1), // Prevent negative scroll
                            behavior: 'smooth'
                        });
                    }
                    // Reset animation state after everything completes
                    setTimeout(function () {
                        setIsAnimating(false);
                    }, 500); // Increased duration to account for scroll
                    return [2 /*return*/];
            }
        });
    }); };
    var getTotalProducts = function () {
        return Object.values(selection).reduce(function (total, category) { return total + Object.values(category).reduce(function (sum, count) { return sum + count; }, 0); }, 0);
    };
    var handleNext = function () {
        var formattedProducts = Object.entries(selection).flatMap(function (_a) {
            var categoryId = _a[0], products = _a[1];
            return Object.entries(products)
                .filter(function (_a) {
                var _ = _a[0], count = _a[1];
                return count > 0;
            })
                .map(function (_a) {
                var _b, _c;
                var productId = _a[0], count = _a[1];
                var category = categories.find(function (c) { return c.id === parseInt(categoryId); });
                var product = (_b = categoryProducts[parseInt(categoryId)]) === null || _b === void 0 ? void 0 : _b.find(function (p) { return p.id === parseInt(productId); });
                return {
                    category: (category === null || category === void 0 ? void 0 : category.Title) || '',
                    name: ((_c = product === null || product === void 0 ? void 0 : product.attributes) === null || _c === void 0 ? void 0 : _c.Name) || '',
                    quantity: count
                };
            });
        });
        console.log('Products being saved:', formattedProducts);
        updateState({
            products: formattedProducts
        });
        nextStep();
    };
    if (isLoading) {
        return (<FunnelStep_1.default title="Wählen Sie Ihre Produkte" subtitle="Laden..." currentStep={currentStep} totalSteps={5}>
        <div className="animate-pulse space-y-4">
          {[1, 2, 3].map(function (i) { return (<div key={i} className="h-24 bg-gray-200 rounded-lg"/>); })}
        </div>
      </FunnelStep_1.default>);
    }
    console.log('[ProductSelection] Raw category data:', categories.map(function (cat) { return ({
        id: cat.id,
        Title: cat.Title,
        ShortDescription: cat.ShortDescription,
        Description: cat.Description
    }); }));
    return (<FunnelStep_1.default title="Wählen Sie Ihre Produkte" subtitle="Klicken Sie auf die gewünschten Kategorien, um Produkte auszuwählen" onNext={handleNext} isValid={getTotalProducts() > 0} currentStep={currentStep} totalSteps={5}>
      <div className="pb-24">
        <div className="space-y-6">
          {categories.map(function (category) {
            var _a, _b, _c, _d;
            return (<div key={category.id} className="space-y-4" ref={function (el) { return categoryRefs.current[category.id] = el; }}>
              <button onClick={function () { return handleCategoryClick(category.id, category.slug); }} className={"w-full bg-white rounded-lg shadow-sm hover:shadow-md transition-all duration-300 p-3 group ".concat(expandedCategory === category.id ? 'ring-2 ring-tuscher-blue ring-opacity-50' : '')}>
                <div className="flex items-center justify-between gap-3">
                  <div className="flex items-center gap-3">
                    {((_d = (_c = (_b = (_a = category.Image) === null || _a === void 0 ? void 0 : _a.data) === null || _b === void 0 ? void 0 : _b[0]) === null || _c === void 0 ? void 0 : _c.attributes) === null || _d === void 0 ? void 0 : _d.url) && (<div className="relative w-14 h-14 rounded-lg overflow-hidden flex-shrink-0">
                        <image_1.default src={(0, api_1.getImageUrl)(category.Image.data[0].attributes.url)} alt={category.Title || ''} fill className="object-cover transition-transform duration-300 group-hover:scale-105"/>
                      </div>)}
                    <div className="text-left flex-1 min-w-0">
                      <h3 className="font-medium text-base text-tuscher-blue mb-1 truncate">
                        {category.Title}
                      </h3>
                     
                    </div>
                  </div>
                  <div className="flex items-center gap-2 flex-shrink-0">
                    {Object.values(selection[category.id] || {}).reduce(function (sum, count) { return sum + count; }, 0) > 0 && (<span className="text-sm px-2.5 py-1 rounded-full bg-tuscher-blue bg-opacity-10 text-tuscher-blue font-medium">
                        {Object.values(selection[category.id] || {}).reduce(function (sum, count) { return sum + count; }, 0)}
                      </span>)}
                    <solid_1.ChevronDownIcon className={"w-4 h-4 text-gray-400 transform transition-transform duration-300 ".concat(expandedCategory === category.id ? 'rotate-180' : '')}/>
                  </div>
                </div>
              </button>

              <framer_motion_1.AnimatePresence mode="wait">
                {expandedCategory === category.id && categoryProducts[category.id] && (<framer_motion_1.motion.div key={"category-".concat(category.id)} initial={{ height: 0, opacity: 0 }} animate={{
                        height: 'auto',
                        opacity: 1,
                        transition: {
                            height: { duration: 0.3, ease: [0.4, 0, 0.2, 1] },
                            opacity: { duration: 0.2, delay: 0.1 }
                        }
                    }} exit={{
                        height: 0,
                        opacity: 0,
                        transition: {
                            height: { duration: 0.2, ease: [0.4, 0, 0.2, 1] },
                            opacity: { duration: 0.1 }
                        }
                    }} className="overflow-hidden">
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 px-3 py-2">
                      {categoryProducts[category.id].map(function (product) {
                        var _a, _b, _c, _d;
                        return (<framer_motion_1.motion.div key={product.id} initial={{ y: 20, opacity: 0 }} animate={{
                                y: 0,
                                opacity: 1,
                                transition: {
                                    duration: 0.3,
                                    ease: 'easeOut'
                                }
                            }} className="relative min-h-[120px] rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all duration-300 group bg-white">
                          <div className="flex h-full">
                            <div className="relative w-28 flex-shrink-0">
                              {((_c = (_b = (_a = product.attributes.MainImage) === null || _a === void 0 ? void 0 : _a.data) === null || _b === void 0 ? void 0 : _b.attributes) === null || _c === void 0 ? void 0 : _c.url) ? (<image_1.default src={(0, api_1.getImageUrl)(product.attributes.MainImage.data.attributes.url)} alt={product.attributes.Name} fill className="object-cover" sizes="96px"/>) : (<div className="w-full h-full bg-gray-100 flex items-center justify-center">
                                  <span className="text-gray-400 text-xs">Kein Bild</span>
                                </div>)}
                            </div>

                            <div className="flex-1 p-3 flex flex-col min-w-0">
                              <div className="flex-grow">
                                <h4 className="text-sm font-medium text-gray-900 mb-1">
                                  {product.attributes.Name}
                                </h4>
                                <p className="text-xs text-gray-600 leading-relaxed">
                                  {product.attributes.ShortDescription}
                                </p>
                              </div>

                              <div className="flex items-center justify-end pt-2 mt-auto border-t border-gray-100">
                                <div className="inline-flex items-center bg-gray-50 rounded-lg overflow-hidden border border-gray-200">
                                  <button onClick={function (e) {
                                var _a;
                                e.stopPropagation();
                                var currentCount = ((_a = selection[category.id]) === null || _a === void 0 ? void 0 : _a[product.id]) || 0;
                                if (currentCount > 0) {
                                    setSelection(function (prev) {
                                        var _a, _b;
                                        return (__assign(__assign({}, prev), (_a = {}, _a[category.id] = __assign(__assign({}, (prev[category.id] || {})), (_b = {}, _b[product.id] = currentCount - 1, _b)), _a)));
                                    });
                                }
                            }} className="w-8 h-8 flex items-center justify-center hover:bg-gray-100 text-gray-600 transition-colors">
                                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M20 12H4"/>
                                    </svg>
                                  </button>
                                  <span className="w-10 text-center text-sm font-medium text-gray-700">
                                    {((_d = selection[category.id]) === null || _d === void 0 ? void 0 : _d[product.id]) || 0}
                                  </span>
                                  <button onClick={function (e) {
                                var _a;
                                e.stopPropagation();
                                var currentCount = ((_a = selection[category.id]) === null || _a === void 0 ? void 0 : _a[product.id]) || 0;
                                setSelection(function (prev) {
                                    var _a, _b;
                                    return (__assign(__assign({}, prev), (_a = {}, _a[category.id] = __assign(__assign({}, (prev[category.id] || {})), (_b = {}, _b[product.id] = currentCount + 1, _b)), _a)));
                                });
                            }} className="w-8 h-8 flex items-center justify-center hover:bg-gray-100 text-gray-600 transition-colors">
                                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 4v16m8-8H4"/>
                                    </svg>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </framer_motion_1.motion.div>);
                    })}
                    </div>
                  </framer_motion_1.motion.div>)}
              </framer_motion_1.AnimatePresence>
            </div>);
        })}
        </div>

        {getTotalProducts() > 0 && (<div className="mt-8 p-6 bg-gray-50 rounded-lg border border-gray-100">
            <h4 className="font-semibold text-lg text-tuscher-blue mb-4">Ihre Auswahl:</h4>
            <ul className="space-y-3">
              {Object.entries(selection).map(function (_a) {
                var categoryIdStr = _a[0], products = _a[1];
                var categoryId = parseInt(categoryIdStr);
                var category = categories.find(function (c) { return c.id === categoryId; });
                var productCounts = Object.entries(products).filter(function (_a) {
                    var _ = _a[0], count = _a[1];
                    return count > 0;
                });
                if (productCounts.length === 0)
                    return null;
                return (<li key={categoryId} className="pb-3 border-b border-gray-100 last:border-0">
                    <strong className="text-gray-700">{category === null || category === void 0 ? void 0 : category.Title}:</strong>
                    <div className="mt-1 flex flex-wrap gap-2">
                      {productCounts.map(function (_a) {
                        var _b;
                        var productIdStr = _a[0], count = _a[1];
                        var productId = parseInt(productIdStr);
                        var product = (_b = categoryProducts[categoryId]) === null || _b === void 0 ? void 0 : _b.find(function (p) { return p.id === productId; });
                        return (<span key={productId} className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600">
                            {product === null || product === void 0 ? void 0 : product.attributes.Name} ({count}x)
                          </span>);
                    })}
                    </div>
                  </li>);
            })}
            </ul>
          </div>)}
      </div>
    </FunnelStep_1.default>);
};
exports.default = ProductSelectionStep;
