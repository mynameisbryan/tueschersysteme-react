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
var ScrollButton_1 = require("@/components/ui/ScrollButton");
var HeroBackgroundImage_1 = require("./HeroBackgroundImage");
var FeatureItem_1 = require("./FeatureItem");
var qs_1 = require("qs");
var link_1 = require("next/link");
function getHeroContent() {
    return __awaiter(this, void 0, void 0, function () {
        var query, response, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    query = qs_1.default.stringify({
                        populate: '*'
                    }, {
                        encodeValuesOnly: true
                    });
                    return [4 /*yield*/, (0, api_1.fetchAPI)('/api/hero-section', { populate: '*' })];
                case 1:
                    response = _a.sent();
                    if (!(response === null || response === void 0 ? void 0 : response.data)) {
                        console.error('[Hero] Invalid hero content structure:', response);
                        return [2 /*return*/, null];
                    }
                    return [2 /*return*/, response];
                case 2:
                    error_1 = _a.sent();
                    console.error('[Hero] Error fetching content:', error_1);
                    return [2 /*return*/, null];
                case 3: return [2 /*return*/];
            }
        });
    });
}
function HeroSection() {
    var _a, _b, _c, _d, _e, _f;
    return __awaiter(this, void 0, void 0, function () {
        var heroContent, _g, _h, Title, _j, Description, _k, CallToActionText, _l, CallToActionLink, _m, featureitems, BackgroundImage, imageUrl;
        return __generator(this, function (_o) {
            switch (_o.label) {
                case 0: return [4 /*yield*/, getHeroContent()];
                case 1:
                    heroContent = _o.sent();
                    if (!(heroContent === null || heroContent === void 0 ? void 0 : heroContent.data)) {
                        console.error('[Hero] No content available');
                        return [2 /*return*/, (<section className="relative h-[70vh] mt-20 bg-tuscher-blue">
        <div className="container mx-auto px-4">
          <p className="text-white text-center">Failed to load hero content.</p>
        </div>
      </section>)];
                    }
                    _g = heroContent.data, _h = _g.Title, Title = _h === void 0 ? '' : _h, _j = _g.Description, Description = _j === void 0 ? '' : _j, _k = _g.CallToActionText, CallToActionText = _k === void 0 ? '' : _k, _l = _g.CallToActionLink, CallToActionLink = _l === void 0 ? '#' : _l, _m = _g.featureitems, featureitems = _m === void 0 ? [] : _m, BackgroundImage = _g.BackgroundImage;
                    imageUrl = (BackgroundImage === null || BackgroundImage === void 0 ? void 0 : BackgroundImage.url) ||
                        ((_b = (_a = BackgroundImage === null || BackgroundImage === void 0 ? void 0 : BackgroundImage.formats) === null || _a === void 0 ? void 0 : _a.large) === null || _b === void 0 ? void 0 : _b.url) ||
                        ((_d = (_c = BackgroundImage === null || BackgroundImage === void 0 ? void 0 : BackgroundImage.formats) === null || _c === void 0 ? void 0 : _c.medium) === null || _d === void 0 ? void 0 : _d.url) ||
                        ((_f = (_e = BackgroundImage === null || BackgroundImage === void 0 ? void 0 : BackgroundImage.formats) === null || _e === void 0 ? void 0 : _e.small) === null || _f === void 0 ? void 0 : _f.url) ||
                        '';
                    console.log('[Hero] Image URL:', imageUrl);
                    if (!imageUrl) {
                        console.warn('[Hero] No image URL found in:', BackgroundImage);
                    }
                    return [2 /*return*/, (<section className="relative min-h-[480px] sm:min-h-[520px] md:min-h-[580px] 
                        mt-[var(--header-height)] bg-tuscher-blue">
      {/* Background Image with Overlay */}
      {imageUrl && (<>
          <HeroBackgroundImage_1.default imageUrl={imageUrl}/>
          <div className="hero-overlay-light"/>
        </>)}
      
      {/* Content Container */}
      <div className="container relative h-full py-6 sm:py-8 md:py-12">
        <div className="flex flex-col lg:flex-row items-start lg:items-center 
                      justify-between h-full gap-6 sm:gap-8 md:gap-12">
          {/* Left Side - Hero Content */}
          <div className="w-full lg:w-5/12 space-y-3 sm:space-y-4 md:space-y-6 pt-4 sm:pt-6">
            <h1 className="text-2xl sm:text-3xl md:text-4xl xl:text-5xl font-bold 
                         text-white leading-tight tracking-tight">
              {Title}
            </h1>
            <p className="text-base sm:text-lg text-gray-100/90 leading-relaxed max-w-xl">
              {Description}
            </p>
            <div className="flex flex-col sm:flex-row gap-3 sm:gap-4 pt-2">
              <link_1.default href="/salesfunnel" className="btn-primary-hero">
                Passende Lösung finden
              </link_1.default>
              <ScrollButton_1.default href="#products-section" className="btn-secondary">
                Unsere Produkte
              </ScrollButton_1.default>
            </div>
          </div>
          
          {/* Right Side - Features List */}
          {featureitems.length > 0 && (<div className="w-full lg:w-6/12">
              <div className="glass-card-dark p-5 sm:p-6 md:p-8">
                <h2 className="text-lg sm:text-xl md:text-2xl font-bold 
                             mb-4 sm:mb-5 md:mb-6 text-white">
                  Warum Tüscher Systeme?
                </h2>
                <ul className="space-y-3 sm:space-y-4">
                  {featureitems.map(function (item) { return (<FeatureItem_1.default key={item.id} title={item.title} icon={item.icon}/>); })}
                </ul>
              </div>
            </div>)}
        </div>
      </div>
    </section>)];
            }
        });
    });
}
exports.default = HeroSection;
