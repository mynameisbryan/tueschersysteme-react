"use strict";
/**
 * test controller
 */
Object.defineProperty(exports, "__esModule", { value: true });
var strapi_1 = require("@strapi/strapi");
exports.default = strapi_1.factories.createCoreController('api::test.test');