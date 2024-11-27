"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var ProductCard_1 = require("./ProductCard");
var LoadingGrid_1 = require("./LoadingGrid");
var api_1 = require("@/utils/api");
function ProductGrid(_a) {
    var products = _a.products, isLoading = _a.isLoading, activeCategory = _a.activeCategory;
    if (isLoading)
        return <LoadingGrid_1.default />;
    return (<div className="container mx-auto">
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 p-4 sm:p-6 lg:p-8 max-w-7xl mx-auto">
        {products.map(function (product) {
            var _a, _b, _c;
            console.log('[ProductGrid] Processing product:', {
                name: product.Name,
                rawMainImage: product.MainImage,
                rawUrl: (_a = product.MainImage) === null || _a === void 0 ? void 0 : _a.url
            });
            var imageUrl = ((_b = product.MainImage) === null || _b === void 0 ? void 0 : _b.url)
                ? (0, api_1.getImageUrl)(product.MainImage.url)
                : null;
            console.log('[ProductGrid] Constructed image URL:', {
                name: product.Name,
                imageUrl: imageUrl,
                hasUrl: !!imageUrl
            });
            return (<ProductCard_1.default key={product.id} title={product.Name} description={product.ShortDescription} imageUrl={imageUrl} imageAlt={product.Name} features={product.Features || []} category={((_c = product.product_category) === null || _c === void 0 ? void 0 : _c.Title) || 'Kategorie'}/>);
        })}
      </div>
    </div>);
}
exports.default = ProductGrid;
