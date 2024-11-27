'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var cn_1 = require("@/utils/cn");
var react_1 = require("react");
function CategoryTabs(_a) {
    var categories = _a.categories, activeSlug = _a.activeSlug, onCategoryChange = _a.onCategoryChange;
    var tabsContainerRef = (0, react_1.useRef)(null);
    var activeTabRef = (0, react_1.useRef)(null);
    // Center active tab when it changes
    (0, react_1.useEffect)(function () {
        if (tabsContainerRef.current && activeTabRef.current) {
            var container = tabsContainerRef.current;
            var activeTab = activeTabRef.current;
            // Calculate the center position
            var containerWidth = container.offsetWidth;
            var tabWidth = activeTab.offsetWidth;
            var tabLeft = activeTab.offsetLeft;
            var scrollLeft = tabLeft - (containerWidth / 2) + (tabWidth / 2);
            // Smooth scroll to center
            container.scrollTo({
                left: scrollLeft,
                behavior: 'smooth'
            });
        }
    }, [activeSlug]);
    console.log('[CategoryTabs] Rendering:', JSON.stringify({
        categoriesCount: categories === null || categories === void 0 ? void 0 : categories.length,
        activeSlug: activeSlug,
        availableSlugs: categories === null || categories === void 0 ? void 0 : categories.map(function (c) { return c.slug; })
    }, null, 2));
    var handleCategoryClick = function (slug) {
        console.log('[CategoryTabs] Category clicked:', {
            clickedSlug: slug,
            currentActiveSlug: activeSlug,
            availableSlugs: categories.map(function (c) { return ({ slug: c.slug, title: c.Title }); })
        });
        onCategoryChange(slug);
    };
    if (!(categories === null || categories === void 0 ? void 0 : categories.length)) {
        console.warn('[CategoryTabs] No categories available');
        return null;
    }
    return (<div className="sticky top-[80px] z-30 bg-white/95 backdrop-blur-sm border-b border-gray-200">
      <div className="container mx-auto px-4 py-4 sm:py-6">
        <div ref={tabsContainerRef} className="flex gap-2 sm:gap-4 overflow-x-auto scrollbar-hide -mx-4 px-4 pb-4 scroll-smooth">
          {categories.map(function (category) { return (<button key={category.id} ref={category.slug === activeSlug ? activeTabRef : null} onClick={function () { return handleCategoryClick(category.slug || ''); }} className={(0, cn_1.cn)("px-4 sm:px-6 py-2 sm:py-3 whitespace-nowrap rounded-lg transition-all duration-200", "text-sm sm:text-base font-medium flex-shrink-0", "hover:transform hover:scale-105 active:scale-95", activeSlug === category.slug
                ? "bg-tuscher-blue text-white shadow-lg"
                : "bg-gray-100 hover:bg-gray-200 text-gray-700")}>
              {category.Title || 'Untitled'}
            </button>); })}
        </div>
      </div>
    </div>);
}
exports.default = CategoryTabs;
