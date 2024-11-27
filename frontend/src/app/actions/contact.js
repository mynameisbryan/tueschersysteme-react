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
exports.submitContactForm = void 0;
var zod_1 = require("zod");
var contactFormSchema = zod_1.z.object({
    data: zod_1.z.object({
        name: zod_1.z.string().min(2, "Name must be at least 2 characters"),
        email: zod_1.z.string().email("Invalid email address"),
        phone: zod_1.z.string().optional(),
        message: zod_1.z.string().min(10, "Message must be at least 10 characters"),
        privacy: zod_1.z.boolean().refine(function (val) { return val === true; }, {
            message: "You must accept the privacy policy"
        }),
        newsletter: zod_1.z.boolean()
    })
});
var getStrapiUrl = function () {
    var isDevelopment = process.env.NODE_ENV === 'development';
    return isDevelopment
        ? 'http://localhost:1337'
        : process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337';
};
function submitContactForm(formData) {
    var _a;
    return __awaiter(this, void 0, void 0, function () {
        var strapiUrl, strapiData, response, errorMessage, errorData, _b, error_1;
        return __generator(this, function (_c) {
            switch (_c.label) {
                case 0:
                    _c.trys.push([0, 7, , 8]);
                    if (!process.env.STRAPI_API_TOKEN) {
                        throw new Error('Missing required API token');
                    }
                    strapiUrl = getStrapiUrl();
                    console.log('Submitting to Strapi URL:', strapiUrl);
                    strapiData = {
                        data: formData
                    };
                    console.log('Sending data to Strapi:', JSON.stringify(strapiData, null, 2));
                    return [4 /*yield*/, fetch("".concat(strapiUrl, "/api/contact-forms"), {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Authorization': "Bearer ".concat(process.env.STRAPI_API_TOKEN),
                                'Accept': 'application/json'
                            },
                            body: JSON.stringify(strapiData),
                            cache: 'no-store'
                        })];
                case 1:
                    response = _c.sent();
                    if (!!response.ok) return [3 /*break*/, 6];
                    errorMessage = 'Failed to submit form';
                    _c.label = 2;
                case 2:
                    _c.trys.push([2, 4, , 5]);
                    return [4 /*yield*/, response.json()];
                case 3:
                    errorData = _c.sent();
                    errorMessage = ((_a = errorData.error) === null || _a === void 0 ? void 0 : _a.message) || errorData.message || errorMessage;
                    return [3 /*break*/, 5];
                case 4:
                    _b = _c.sent();
                    errorMessage = "".concat(response.status, ": ").concat(response.statusText);
                    return [3 /*break*/, 5];
                case 5: throw new Error(errorMessage);
                case 6: return [2 /*return*/, { success: true }];
                case 7:
                    error_1 = _c.sent();
                    console.error('Submit error details:', error_1);
                    return [2 /*return*/, {
                            success: false,
                            error: error_1 instanceof zod_1.z.ZodError
                                ? error_1.errors[0].message
                                : error_1 instanceof Error
                                    ? error_1.message
                                    : 'Failed to submit form'
                        }];
                case 8: return [2 /*return*/];
            }
        });
    });
}
exports.submitContactForm = submitContactForm;
