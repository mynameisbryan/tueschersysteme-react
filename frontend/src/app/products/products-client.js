'use client';
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
var react_1 = require("react");
var navigation_1 = require("next/navigation");
var ProductHero_1 = require("@/components/products/ProductHero");
var CategoryTabs_1 = require("@/components/products/CategoryTabs");
var ProductGrid_1 = require("@/components/products/ProductGrid");
var ProductCTA_1 = require("@/components/products/ProductCTA");
var productApi_1 = require("@/utils/productApi");
function ProductsClient(_a) {
    var _this = this;
    var _b, _c, _d, _e;
    var categories = _a.categories, defaultCategory = _a.defaultCategory;
    var router = (0, navigation_1.useRouter)();
    var searchParams = (0, navigation_1.useSearchParams)();
    var _f = (0, react_1.useState)(defaultCategory), activeCategory = _f[0], setActiveCategory = _f[1];
    var _g = (0, react_1.useState)([]), products = _g[0], setProducts = _g[1];
    var _h = (0, react_1.useState)(true), isLoading = _h[0], setIsLoading = _h[1];
    var _j = (0, react_1.useState)(null), error = _j[0], setError = _j[1];
    // Handle URL updates when category changes
    var handleCategoryChange = function (slug) {
        var newCategory = categories.find(function (cat) { return cat.slug === slug; });
        if (newCategory && newCategory.slug !== (activeCategory === null || activeCategory === void 0 ? void 0 : activeCategory.slug)) {
            setActiveCategory(newCategory);
            // Update URL without reload
            var params = new URLSearchParams(searchParams.toString());
            params.set('category', slug);
            router.push("/products?".concat(params.toString()), { scroll: false });
        }
    };
    // Load products when category changes
    (0, react_1.useEffect)(function () {
        if (!(activeCategory === null || activeCategory === void 0 ? void 0 : activeCategory.slug))
            return;
        var isMounted = true;
        setIsLoading(true);
        setError(null);
        var loadProducts = function () { return __awaiter(_this, void 0, void 0, function () {
            var response, err_1;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        _a.trys.push([0, 2, 3, 4]);
                        return [4 /*yield*/, (0, productApi_1.getCategoryProducts)(activeCategory.slug)];
                    case 1:
                        response = _a.sent();
                        if (!isMounted)
                            return [2 /*return*/];
                        setProducts(response.data || []);
                        return [3 /*break*/, 4];
                    case 2:
                        err_1 = _a.sent();
                        if (!isMounted)
                            return [2 /*return*/];
                        console.error('[ProductsClient] Error:', err_1);
                        setError('Produkte konnten nicht geladen werden');
                        return [3 /*break*/, 4];
                    case 3:
                        if (isMounted)
                            setIsLoading(false);
                        return [7 /*endfinally*/];
                    case 4: return [2 /*return*/];
                }
            });
        }); };
        loadProducts();
        return function () { isMounted = false; };
    }, [activeCategory === null || activeCategory === void 0 ? void 0 : activeCategory.slug]);
    // Handle error state
    if (error) {
        return (<div className="container mx-auto px-4 py-8">
        <div className="bg-red-50 border border-red-200 rounded-lg p-4">
          <p className="text-red-700">{error}</p>
        </div>
      </div>);
    }
    return (<>
      <ProductHero_1.default title={activeCategory.Title} description={activeCategory.Description} image={(_e = (_d = (_c = (_b = activeCategory.Image) === null || _b === void 0 ? void 0 : _b.data) === null || _c === void 0 ? void 0 : _c[0]) === null || _d === void 0 ? void 0 : _d.attributes) === null || _e === void 0 ? void 0 : _e.url}/>
      <CategoryTabs_1.default categories={categories} activeSlug={activeCategory.slug} onCategoryChange={handleCategoryChange}/>
      <div id="products">
        <ProductGrid_1.default products={products} isLoading={isLoading} activeCategory={activeCategory.slug}/>
      </div>
      <ProductCTA_1.default />
    </>);
}
exports.default = ProductsClient;
