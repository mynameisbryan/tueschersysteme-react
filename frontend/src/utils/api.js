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
exports.getImpressumData = exports.getCategoryProducts = exports.submitSalesFunnelInquiry = exports.getWelcomeContent = exports.getImageUrl = exports.getFileResources = exports.sendContactForm = exports.getContactData = exports.getFAQs = exports.getHomeProductCategories = exports.getProductCategories = exports.fetchAPI = void 0;
var qs_1 = require("qs");
// Replace existing API_CONFIG with new URL handler
var getStrapiURL = function (path) {
    if (path === void 0) { path = ''; }
    var baseUrl = typeof window === 'undefined'
        ? process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337'
        : process.env.NEXT_PUBLIC_STRAPI_API_URL || 'http://localhost:1337';
    return "".concat(baseUrl).concat(path);
};
// Update getToken function
var getToken = function () { return __awaiter(void 0, void 0, void 0, function () {
    var token;
    return __generator(this, function (_a) {
        token = process.env.NEXT_PUBLIC_STRAPI_TOKEN || process.env.STRAPI_API_TOKEN;
        if (!token) {
            console.warn('[API] No API token found');
            throw new Error('API token is not configured');
        }
        return [2 /*return*/, token];
    });
}); };
// Update fetchAPI function to include encodeValuesOnly
function fetchAPI(endpoint, options) {
    if (options === void 0) { options = {}; }
    return __awaiter(this, void 0, void 0, function () {
        var requestUrl, token, queryString, url, response, errorText, data, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    requestUrl = getStrapiURL(endpoint);
                    return [4 /*yield*/, getToken()];
                case 1:
                    token = _a.sent();
                    queryString = options ? "?".concat(qs_1.default.stringify(options, { encodeValuesOnly: true })) : '';
                    url = "".concat(requestUrl).concat(queryString);
                    console.log('[API] Request details:', {
                        endpoint: endpoint,
                        baseUrl: requestUrl,
                        hasToken: !!token,
                        tokenPrefix: token ? token.substring(0, 10) + '...' : null,
                        queryParams: queryString,
                        timestamp: new Date().toISOString()
                    });
                    _a.label = 2;
                case 2:
                    _a.trys.push([2, 7, , 8]);
                    return [4 /*yield*/, fetch(url, {
                            headers: {
                                'Content-Type': 'application/json',
                                Authorization: "Bearer ".concat(token)
                            },
                            cache: 'no-store'
                        })];
                case 3:
                    response = _a.sent();
                    console.log('[API] Response status:', {
                        endpoint: endpoint,
                        status: response.status,
                        ok: response.ok,
                        statusText: response.statusText
                    });
                    if (!!response.ok) return [3 /*break*/, 5];
                    return [4 /*yield*/, response.text()];
                case 4:
                    errorText = _a.sent();
                    console.error('[API] Response error:', {
                        status: response.status,
                        statusText: response.statusText,
                        body: errorText,
                        url: url.replace(token, '***')
                    });
                    throw new Error("API request failed: ".concat(response.status, " ").concat(response.statusText));
                case 5: return [4 /*yield*/, response.json()];
                case 6:
                    data = _a.sent();
                    return [2 /*return*/, data];
                case 7:
                    error_1 = _a.sent();
                    console.error('[API] Fetch error:', {
                        endpoint: endpoint,
                        error: error_1 instanceof Error ? {
                            name: error_1.name,
                            message: error_1.message,
                            stack: error_1.stack
                        } : String(error_1),
                        url: url.replace(token, '***')
                    });
                    throw error_1;
                case 8: return [2 /*return*/];
            }
        });
    });
}
exports.fetchAPI = fetchAPI;
var getProductCategories = function (query) { return __awaiter(void 0, void 0, void 0, function () {
    var defaultQuery, response, transformedData, error_2;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                defaultQuery = __assign({ sort: ['Order:asc'], populate: {
                        Image: { fields: ['url', 'alternativeText', 'width', 'height', 'formats'] },
                        products: {
                            sort: ['Order:asc'],
                            populate: {
                                MainImage: { fields: ['url', 'alternativeText', 'width', 'height', 'formats'] }
                            }
                        }
                    } }, query);
                return [4 /*yield*/, fetchAPI('/api/product-categories', defaultQuery)];
            case 1:
                response = _a.sent();
                if (response === null || response === void 0 ? void 0 : response.data) {
                    response.data.sort(function (a, b) { return a.Order - b.Order; });
                }
                if (!(response === null || response === void 0 ? void 0 : response.data)) {
                    throw new Error('Invalid API response structure');
                }
                console.log('[API] Product categories raw response:', {
                    count: response.data.length,
                    firstItem: response.data[0] ? {
                        id: response.data[0].id,
                        title: response.data[0].Title
                    } : null
                });
                transformedData = {
                    data: response.data.map(function (item) { return ({
                        id: item.id,
                        documentId: item.documentId || '',
                        Title: item.Title || '',
                        Description: item.Description || '',
                        slug: item.slug || '',
                        Image: Array.isArray(item.Image) ? item.Image : [],
                        products: [], // We'll handle products in a separate query
                        createdAt: item.createdAt || '',
                        updatedAt: item.updatedAt || '',
                        publishedAt: item.publishedAt || ''
                    }); }),
                    meta: response.meta
                };
                return [2 /*return*/, transformedData];
            case 2:
                error_2 = _a.sent();
                console.error('[API] getProductCategories error:', error_2);
                throw error_2;
            case 3: return [2 /*return*/];
        }
    });
}); };
exports.getProductCategories = getProductCategories;
var getHomeProductCategories = function (page, pageSize) {
    if (page === void 0) { page = 1; }
    if (pageSize === void 0) { pageSize = 9; }
    return __awaiter(void 0, void 0, void 0, function () {
        var query;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    query = {
                        pagination: { page: page, pageSize: pageSize },
                        populate: {
                            Image: { populate: '*' }
                        }
                    };
                    return [4 /*yield*/, fetchAPI('/api/product-categories', query)];
                case 1: return [2 /*return*/, _a.sent()];
            }
        });
    });
};
exports.getHomeProductCategories = getHomeProductCategories;
var getFAQs = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, fetchAPI('/api/faqs', { populate: '*' })];
            case 1: return [2 /*return*/, _a.sent()];
        }
    });
}); };
exports.getFAQs = getFAQs;
var getContactData = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, fetchAPI('/api/contactsection', { populate: '*' })];
            case 1: return [2 /*return*/, _a.sent()];
        }
    });
}); };
exports.getContactData = getContactData;
function sendContactForm(formData) {
    var response = fetchAPI('/api/contact-forms', {
        method: 'POST',
        body: JSON.stringify({ data: formData }),
    });
    return response;
}
exports.sendContactForm = sendContactForm;
var getFileResources = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, fetchAPI('/api/file-and-resources', { populate: '*' })];
            case 1: return [2 /*return*/, _a.sent()];
        }
    });
}); };
exports.getFileResources = getFileResources;
var getImageUrl = function (path) {
    if (!path)
        return '';
    if (path.startsWith('http'))
        return path;
    return "".concat(getStrapiURL()).concat(path);
};
exports.getImageUrl = getImageUrl;
var getWelcomeContent = function () { return __awaiter(void 0, void 0, void 0, function () {
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, fetchAPI('/api/welcome-section', { populate: '*' })];
            case 1: return [2 /*return*/, _a.sent()];
        }
    });
}); };
exports.getWelcomeContent = getWelcomeContent;
var submitSalesFunnelInquiry = function (inquiryData) { return __awaiter(void 0, void 0, void 0, function () {
    var contactResponse, contactData, salesResponse, errorData, salesData, error_3;
    var _a, _b, _c, _d, _e, _f, _g;
    return __generator(this, function (_h) {
        switch (_h.label) {
            case 0:
                _h.trys.push([0, 7, , 8]);
                return [4 /*yield*/, fetchAPI('/api/contact-forms', {
                        method: 'POST',
                        body: JSON.stringify({
                            data: {
                                name: inquiryData.contact.name,
                                email: inquiryData.contact.email,
                                phone: inquiryData.contact.phone || null,
                                company: inquiryData.contact.company || null,
                                message: "Sales Funnel Inquiry - Budget: ".concat(inquiryData.budget),
                                wantContact: inquiryData.contact.wantContact || false,
                                method: inquiryData.contact.method || null,
                                time: inquiryData.contact.time || null,
                                privacy: inquiryData.contact.privacy,
                                newsletter: inquiryData.contact.newsletter || false
                            }
                        })
                    })];
            case 1:
                contactResponse = _h.sent();
                if (!contactResponse.ok) {
                    throw new Error('Failed to create contact form');
                }
                return [4 /*yield*/, contactResponse.json()];
            case 2:
                contactData = _h.sent();
                return [4 /*yield*/, fetchAPI('/api/sales-inquiries', {
                        method: 'POST',
                        body: JSON.stringify({
                            data: {
                                products: inquiryData.products,
                                budget: inquiryData.budget,
                                timeline: inquiryData.timeline,
                                contact: contactData.data.id,
                                location: (_a = inquiryData.additionalInfo) === null || _a === void 0 ? void 0 : _a.location,
                                householdSize: (_b = inquiryData.additionalInfo) === null || _b === void 0 ? void 0 : _b.householdSize,
                                livingSituation: (_c = inquiryData.additionalInfo) === null || _c === void 0 ? void 0 : _c.livingSituation,
                                specificRequirements: (_d = inquiryData.additionalInfo) === null || _d === void 0 ? void 0 : _d.specificRequirements,
                                customizationNeeds: ((_e = inquiryData.additionalInfo) === null || _e === void 0 ? void 0 : _e.customizationNeeds) || [],
                                preferredFeatures: ((_f = inquiryData.additionalInfo) === null || _f === void 0 ? void 0 : _f.preferredFeatures) || [],
                                painPoints: (_g = inquiryData.additionalInfo) === null || _g === void 0 ? void 0 : _g.painPoints
                            }
                        })
                    })];
            case 3:
                salesResponse = _h.sent();
                if (!!salesResponse.ok) return [3 /*break*/, 5];
                return [4 /*yield*/, salesResponse.json()];
            case 4:
                errorData = _h.sent();
                console.error('Sales inquiry submission details:', {
                    requestBody: inquiryData,
                    responseStatus: salesResponse.status,
                    responseError: errorData
                });
                throw new Error("Failed to create sales inquiry: ".concat(JSON.stringify(errorData)));
            case 5: return [4 /*yield*/, salesResponse.json()];
            case 6:
                salesData = _h.sent();
                return [2 /*return*/, {
                        success: true,
                        data: {
                            contact: contactData.data,
                            salesInquiry: salesData.data
                        }
                    }];
            case 7:
                error_3 = _h.sent();
                console.error('API Error:', error_3);
                return [2 /*return*/, {
                        success: false,
                        error: error_3 instanceof Error ? error_3.message : 'Ein unerwarteter Fehler ist aufgetreten'
                    }];
            case 8: return [2 /*return*/];
        }
    });
}); };
exports.submitSalesFunnelInquiry = submitSalesFunnelInquiry;
var getCategoryProducts = function (slug) { return __awaiter(void 0, void 0, void 0, function () {
    var response, transformedResponse, error_4;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                console.log('[API] getCategoryProducts called with:', { slug: slug });
                return [4 /*yield*/, fetchAPI('/api/products', {
                        sort: ['Order:asc'],
                        filters: {
                            product_category: {
                                slug: {
                                    $eq: slug,
                                },
                            },
                        },
                        populate: {
                            MainImage: {
                                fields: ['url', 'alternativeText', 'width', 'height'],
                            },
                            product_category: {
                                fields: ['Title', 'slug'],
                            },
                        },
                    })];
            case 1:
                response = _a.sent();
                transformedResponse = {
                    data: response.data.map(function (product) {
                        var _a, _b, _c, _d, _e, _f, _g, _h;
                        return ({
                            id: product.id,
                            attributes: {
                                Name: product.Name,
                                ShortDescription: product.ShortDescription,
                                DetailedDescription: product.DetailedDescription,
                                Features: product.Features,
                                Order: product.Order,
                                MainImage: {
                                    data: {
                                        id: (_a = product.MainImage) === null || _a === void 0 ? void 0 : _a.id,
                                        attributes: {
                                            url: (_b = product.MainImage) === null || _b === void 0 ? void 0 : _b.url,
                                            width: (_c = product.MainImage) === null || _c === void 0 ? void 0 : _c.width,
                                            height: (_d = product.MainImage) === null || _d === void 0 ? void 0 : _d.height,
                                            alternativeText: (_e = product.MainImage) === null || _e === void 0 ? void 0 : _e.alternativeText
                                        }
                                    }
                                },
                                product_category: {
                                    data: {
                                        id: (_f = product.product_category) === null || _f === void 0 ? void 0 : _f.id,
                                        attributes: {
                                            Title: (_g = product.product_category) === null || _g === void 0 ? void 0 : _g.Title,
                                            slug: (_h = product.product_category) === null || _h === void 0 ? void 0 : _h.slug
                                        }
                                    }
                                }
                            }
                        });
                    }),
                    meta: response.meta
                };
                return [2 /*return*/, transformedResponse];
            case 2:
                error_4 = _a.sent();
                console.error('[API] getCategoryProducts error:', {
                    slug: slug,
                    error: error_4 instanceof Error ? error_4.message : String(error_4),
                });
                return [2 /*return*/, {
                        data: [],
                        meta: {
                            pagination: {
                                page: 1,
                                pageSize: 0,
                                pageCount: 0,
                                total: 0,
                            },
                        },
                    }];
            case 3: return [2 /*return*/];
        }
    });
}); };
exports.getCategoryProducts = getCategoryProducts;
function getImpressumData() {
    return __awaiter(this, void 0, void 0, function () {
        var baseUrl, response, error_5;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 2, , 3]);
                    baseUrl = getStrapiURL();
                    console.log('[Impressum] Base URL:', baseUrl);
                    // Log the full request details
                    console.log('[Impressum] Making request to:', '/api/impressum', {
                        populate: '*'
                    });
                    return [4 /*yield*/, fetchAPI('/api/impressum', {
                            populate: '*'
                        })];
                case 1:
                    response = _a.sent();
                    // Log the response
                    console.log('[Impressum] Response received:', response);
                    if (!(response === null || response === void 0 ? void 0 : response.data)) {
                        console.error('[Impressum] No data in response:', response);
                        throw new Error('No data received from API');
                    }
                    return [2 /*return*/, response];
                case 2:
                    error_5 = _a.sent();
                    // Enhanced error logging
                    console.error('[Impressum] API Error:', {
                        error: error_5 instanceof Error ? {
                            message: error_5.message,
                            stack: error_5.stackv
                        } : error_5,
                        timestamp: new Date().toISOString()
                    });
                    throw error_5;
                case 3: return [2 /*return*/];
            }
        });
    });
}
exports.getImpressumData = getImpressumData;
