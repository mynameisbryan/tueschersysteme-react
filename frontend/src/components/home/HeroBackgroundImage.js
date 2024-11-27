'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var image_1 = require("next/image");
var api_1 = require("@/utils/api");
var BLUR_DATA_URL = "data:image/svg+xml;base64,".concat(Buffer.from('<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 1 1"><rect width="1" height="1" fill="#1E3A8A"/></svg>').toString('base64'));
function HeroBackgroundImage(_a) {
    var imageUrl = _a.imageUrl;
    return (<div className="absolute inset-0">
      <image_1.default src={(0, api_1.getImageUrl)(imageUrl)} alt="Hero Background" fill priority sizes="100vw" className="object-cover object-center" quality={100} onError={function (e) {
            console.error('Image failed to load:', {
                src: e.currentTarget.src,
                error: e,
                originalUrl: imageUrl,
                constructedUrl: (0, api_1.getImageUrl)(imageUrl)
            });
        }} placeholder="blur" blurDataURL={BLUR_DATA_URL}/>
    </div>);
}
exports.default = HeroBackgroundImage;
