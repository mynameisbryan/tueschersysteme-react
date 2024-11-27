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
var image_1 = require("next/image");
var markdown_to_jsx_1 = require("markdown-to-jsx");
var CategoryCTA_1 = require("@/components/ui/CategoryCTA");
function loadWelcomeContent() {
    return __awaiter(this, void 0, void 0, function () {
        var response, data, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 3, , 4]);
                    return [4 /*yield*/, fetch("".concat(process.env.NEXT_PUBLIC_STRAPI_API_URL, "/api/welcome-section?populate=*"))];
                case 1:
                    response = _a.sent();
                    return [4 /*yield*/, response.json()];
                case 2:
                    data = _a.sent();
                    return [2 /*return*/, data];
                case 3:
                    error_1 = _a.sent();
                    console.error('[Welcome] Error fetching content:', error_1);
                    return [2 /*return*/, null];
                case 4: return [2 /*return*/];
            }
        });
    });
}
function WelcomeSection() {
    var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m;
    return __awaiter(this, void 0, void 0, function () {
        var welcomeContent, _o, Title, Paragraphs, Catchheader, Catchtext, Catchimage, CTAText, NeherLogo, imageUrl, imageUrlLogo;
        return __generator(this, function (_p) {
            switch (_p.label) {
                case 0: return [4 /*yield*/, loadWelcomeContent()];
                case 1:
                    welcomeContent = _p.sent();
                    if (!(welcomeContent === null || welcomeContent === void 0 ? void 0 : welcomeContent.data)) {
                        return [2 /*return*/, null];
                    }
                    _o = welcomeContent.data, Title = _o.Title, Paragraphs = _o.Paragraphs, Catchheader = _o.Catchheader, Catchtext = _o.Catchtext, Catchimage = _o.Catchimage, CTAText = _o.CTAText, NeherLogo = _o.NeherLogo;
                    imageUrl = (Catchimage === null || Catchimage === void 0 ? void 0 : Catchimage.url) ||
                        ((_b = (_a = Catchimage === null || Catchimage === void 0 ? void 0 : Catchimage.formats) === null || _a === void 0 ? void 0 : _a.large) === null || _b === void 0 ? void 0 : _b.url) ||
                        ((_d = (_c = Catchimage === null || Catchimage === void 0 ? void 0 : Catchimage.formats) === null || _c === void 0 ? void 0 : _c.medium) === null || _d === void 0 ? void 0 : _d.url) ||
                        ((_f = (_e = Catchimage === null || Catchimage === void 0 ? void 0 : Catchimage.formats) === null || _e === void 0 ? void 0 : _e.small) === null || _f === void 0 ? void 0 : _f.url) ||
                        '';
                    imageUrlLogo = (NeherLogo === null || NeherLogo === void 0 ? void 0 : NeherLogo.url) ||
                        ((_h = (_g = NeherLogo === null || NeherLogo === void 0 ? void 0 : NeherLogo.formats) === null || _g === void 0 ? void 0 : _g.large) === null || _h === void 0 ? void 0 : _h.url) ||
                        ((_k = (_j = NeherLogo === null || NeherLogo === void 0 ? void 0 : NeherLogo.formats) === null || _j === void 0 ? void 0 : _j.medium) === null || _k === void 0 ? void 0 : _k.url) ||
                        ((_m = (_l = NeherLogo === null || NeherLogo === void 0 ? void 0 : NeherLogo.formats) === null || _l === void 0 ? void 0 : _l.small) === null || _m === void 0 ? void 0 : _m.url) ||
                        '';
                    return [2 /*return*/, (<section className="section bg-white">
      <div className="container-padding">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-12">
          {/* Left side - Main content (Header + Text in one column) */}
          <div className="space-y-6 lg:sticky lg:top-24">
            {/* Header and text in one column */}
            <div className="space-y-6">
              <h2 className="text-3xl md:text-4xl font-bold text-tuscher-blue leading-tight">
                {Title}
              </h2>
              <div className="space-y-4 text-gray-600/90">
                <div className="relative">
                  <markdown_to_jsx_1.default options={{
                                wrapper: 'div',
                                forceWrapper: true,
                                forceBlock: true,
                            }} className="space-y-4 text-base md:text-lg leading-relaxed">
                    {Paragraphs}
                  </markdown_to_jsx_1.default>
                  {imageUrlLogo && (<div className="relative w-24 h-12 float-right ml-4 mb-4">
                      <image_1.default src={(0, api_1.getImageUrl)(imageUrlLogo)} alt="Neher Logo" fill className="object-contain" sizes="96px" style={{ shapeOutside: 'content-box' }}/>
                    </div>)}
                </div>
              </div>
            </div>
          </div>

          {/* Right side - Card */}
          <div className="w-full max-w-xl mx-auto lg:max-w-none">
            <div className="card overflow-hidden rounded-xl bg-white shadow-lg 
                          transition-all duration-300 hover:shadow-xl hover:-translate-y-1">
              {imageUrl && (<div className="relative aspect-[16/9] overflow-hidden">
                  <div className="absolute inset-0 bg-gradient-to-t from-[var(--color-navy)]/10 to-transparent z-10"/>
                  <image_1.default src={(0, api_1.getImageUrl)(imageUrl)} alt="Welcome Illustration" fill className="object-cover transition-transform duration-500 
                             group-hover:scale-105" sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 500px" priority quality={85}/>
                </div>)}
              
              <div className="p-6 md:p-8">
                <h3 className="text-xl md:text-2xl font-bold text-[var(--color-navy)] mb-4 
                             transition-colors duration-300 group-hover:text-tuscher-blue">
                  {Catchheader}
                </h3>
                <p className="text-gray-600 mb-6 leading-relaxed">
                  {Catchtext}
                </p>
                {CTAText && (<CategoryCTA_1.default href="/salesfunnel" className="w-full mt-6">
                    {CTAText}
                  </CategoryCTA_1.default>)}
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>)];
            }
        });
    });
}
exports.default = WelcomeSection;
