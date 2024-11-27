'use server';
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
exports.submitSalesFunnelInquiry = void 0;
function submitSalesFunnelInquiry(formData) {
    var _a, _b, _c, _d, _e, _f, _g;
    return __awaiter(this, void 0, void 0, function () {
        var apiUrl, apiToken, headers, contactResponse, error, contactData, salesResponse, errorData, salesData, error_1;
        return __generator(this, function (_h) {
            switch (_h.label) {
                case 0:
                    _h.trys.push([0, 9, , 10]);
                    apiUrl = process.env.NEXT_PUBLIC_STRAPI_API_URL || 'http://localhost:1337';
                    apiToken = process.env.STRAPI_API_TOKEN;
                    if (!apiToken) {
                        throw new Error('API token is not configured');
                    }
                    headers = {
                        'Content-Type': 'application/json',
                        'Authorization': "Bearer ".concat(apiToken),
                    };
                    return [4 /*yield*/, fetch("".concat(apiUrl, "/api/contact-forms"), {
                            method: 'POST',
                            headers: headers,
                            body: JSON.stringify({
                                data: {
                                    name: formData.contact.name,
                                    email: formData.contact.email,
                                    phone: formData.contact.phone || null,
                                    company: formData.contact.company || null,
                                    message: "Sales Funnel Inquiry - Budget: ".concat(formData.budget), // Added required message field
                                    wantContact: formData.contact.wantContact || false,
                                    method: formData.contact.method || null,
                                    time: formData.contact.time || null,
                                    privacy: formData.contact.privacy,
                                    newsletter: formData.contact.newsletter || false
                                }
                            })
                        })];
                case 1:
                    contactResponse = _h.sent();
                    if (!!contactResponse.ok) return [3 /*break*/, 3];
                    return [4 /*yield*/, contactResponse.json()];
                case 2:
                    error = _h.sent();
                    console.error('Contact form creation failed:', error);
                    throw new Error('Failed to create contact form');
                case 3: return [4 /*yield*/, contactResponse.json()];
                case 4:
                    contactData = _h.sent();
                    console.log('Contact form created:', contactData);
                    return [4 /*yield*/, fetch("".concat(apiUrl, "/api/sales-inquiries"), {
                            method: 'POST',
                            headers: headers,
                            body: JSON.stringify({
                                data: {
                                    products: formData.products,
                                    budget: formData.budget,
                                    timeline: formData.timeline,
                                    contact: contactData.data.id,
                                    location: ((_a = formData.additionalInfo) === null || _a === void 0 ? void 0 : _a.location) || null,
                                    householdSize: ((_b = formData.additionalInfo) === null || _b === void 0 ? void 0 : _b.householdSize) || null,
                                    livingSituation: ((_c = formData.additionalInfo) === null || _c === void 0 ? void 0 : _c.livingSituation) || null,
                                    specificRequirements: ((_d = formData.additionalInfo) === null || _d === void 0 ? void 0 : _d.specificRequirements) || null,
                                    customizationNeeds: ((_e = formData.additionalInfo) === null || _e === void 0 ? void 0 : _e.customizationNeeds) || [],
                                    preferredFeatures: ((_f = formData.additionalInfo) === null || _f === void 0 ? void 0 : _f.preferredFeatures) || [],
                                    painPoints: ((_g = formData.additionalInfo) === null || _g === void 0 ? void 0 : _g.painPoints) || null
                                }
                            })
                        })];
                case 5:
                    salesResponse = _h.sent();
                    if (!!salesResponse.ok) return [3 /*break*/, 7];
                    return [4 /*yield*/, salesResponse.json()];
                case 6:
                    errorData = _h.sent();
                    console.error('Detailed Sales inquiry error:', {
                        status: salesResponse.status,
                        statusText: salesResponse.statusText,
                        error: errorData
                    });
                    throw new Error("Failed to create sales inquiry: ".concat(JSON.stringify(errorData)));
                case 7: return [4 /*yield*/, salesResponse.json()];
                case 8:
                    salesData = _h.sent();
                    console.log('Sales inquiry created:', salesData);
                    return [2 /*return*/, {
                            success: true,
                            data: {
                                contact: contactData.data,
                                salesInquiry: salesData.data
                            }
                        }];
                case 9:
                    error_1 = _h.sent();
                    console.error('Submission error:', error_1);
                    return [2 /*return*/, {
                            success: false,
                            error: error_1 instanceof Error ? error_1.message : 'Ein unerwarteter Fehler ist aufgetreten'
                        }];
                case 10: return [2 /*return*/];
            }
        });
    });
}
exports.submitSalesFunnelInquiry = submitSalesFunnelInquiry;
