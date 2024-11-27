"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getStrapiUrl = void 0;
var getStrapiUrl = function () {
    var isDevelopment = process.env.NODE_ENV === 'development';
    return isDevelopment
        ? 'http://localhost:1337'
        : process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337';
};
exports.getStrapiUrl = getStrapiUrl;
