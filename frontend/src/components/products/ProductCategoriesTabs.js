'use client';
"use strict";
var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var image_1 = require("next/image");
var api_1 = require("@/utils/api");
var cn_1 = require("@/utils/cn");
function ProductCategoryTabs(_a) {
    var _b;
    var categories = _a.categories;
    // Sort categories by ID using useMemo to avoid unnecessary re-sorting
    var sortedCategories = (0, react_1.useMemo)(function () {
        return __spreadArray([], categories, true).sort(function (a, b) { return (a.Order || 0) - (b.Order || 0); });
    }, [categories]);
    var _c = (0, react_1.useState)(((_b = sortedCategories[0]) === null || _b === void 0 ? void 0 : _b.slug) || ''), activeCategory = _c[0], setActiveCategory = _c[1];
    return (<section className="py-12 bg-white">
      <div className="container">
        <div className="overflow-x-auto pb-4 scrollbar-hide">
          <div className="flex space-x-4 min-w-max">
            {sortedCategories.map(function (category) {
            var _a, _b;
            var imageUrl = (_b = (_a = category.Image) === null || _a === void 0 ? void 0 : _a[0]) === null || _b === void 0 ? void 0 : _b.url;
            return (<button key={category.id} onClick={function () { return setActiveCategory(category.slug); }} className={(0, cn_1.cn)("relative flex-shrink-0 w-72 overflow-hidden rounded-xl transition-all duration-300", "hover:shadow-lg hover:scale-[1.02]", activeCategory === category.slug ? "ring-2 ring-[var(--color-primary)]" : "")}>
                  <div className="relative aspect-[16/9]">
                    <image_1.default src={(0, api_1.getImageUrl)(imageUrl || '')} alt={category.Title} fill className="object-cover"/>
                    <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"/>
                  </div>
                  <div className="absolute bottom-0 p-4 text-white">
                    <h3 className="text-lg font-semibold">{category.Title}</h3>
                    <p className="text-sm text-white/80 line-clamp-2">
                      {category.Description}
                    </p>
                  </div>
                </button>);
        })}
          </div>
        </div>
      </div>
    </section>);
}
exports.default = ProductCategoryTabs;
