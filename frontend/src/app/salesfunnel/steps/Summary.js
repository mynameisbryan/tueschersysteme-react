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
var react_1 = require("react");
var FunnelContext_1 = require("../FunnelContext");
var FunnelStep_1 = require("@/components/salesfunnel/FunnelStep");
var sales_funnel_1 = require("@/app/actions/sales-funnel");
var framer_motion_1 = require("framer-motion");
var salesfunnel_1 = require("@/schemas/salesfunnel");
var zod_1 = require("zod");
var SummarySection = function (_a) {
    var title = _a.title, children = _a.children;
    return (<div className="bg-white/90 backdrop-blur-md rounded-lg p-6 
                  border border-tuscher-blue/10 shadow-lg hover:shadow-xl
                  transition-all duration-300 hover:border-tuscher-blue/20">
    <h3 className="font-bold text-tuscher-blue mb-4">{title}</h3>
    {children}
  </div>);
};
var Step6Summary = function () {
    var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l;
    var _m = (0, FunnelContext_1.useFunnel)(), state = _m.state, currentStep = _m.currentStep, previousStep = _m.previousStep;
    var _o = (0, react_1.useState)(false), isSubmitting = _o[0], setIsSubmitting = _o[1];
    var _p = (0, react_1.useState)('idle'), status = _p[0], setStatus = _p[1];
    var _q = (0, react_1.useState)(''), errorMessage = _q[0], setErrorMessage = _q[1];
    var _r = (0, react_1.useState)(false), isSubmitted = _r[0], setIsSubmitted = _r[1];
    var handleSubmit = function (e) { return __awaiter(void 0, void 0, void 0, function () {
        var validatedData, response, successElement, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    e.preventDefault();
                    setIsSubmitting(true);
                    setStatus('idle');
                    setErrorMessage('');
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, 4, 5]);
                    validatedData = salesfunnel_1.salesFunnelSchema.parse(state);
                    console.log('Submitting data:', validatedData);
                    return [4 /*yield*/, (0, sales_funnel_1.submitSalesFunnelInquiry)(validatedData)];
                case 2:
                    response = _a.sent();
                    console.log('API Response:', response);
                    if (response.success && response.data) {
                        setStatus('success');
                    }
                    else {
                        setStatus('error');
                        setErrorMessage(response.error || 'Fehler beim Speichern der Daten');
                    }
                    setIsSubmitted(true);
                    successElement = document.getElementById('submit-success');
                    if (successElement) {
                        successElement.scrollIntoView({
                            behavior: 'smooth',
                            block: 'center'
                        });
                    }
                    return [3 /*break*/, 5];
                case 3:
                    error_1 = _a.sent();
                    console.error('Submission error:', error_1);
                    setStatus('error');
                    setErrorMessage(error_1 instanceof zod_1.z.ZodError
                        ? 'Validierungsfehler: ' + error_1.errors[0].message
                        : error_1 instanceof Error
                            ? error_1.message
                            : 'Ein unerwarteter Fehler ist aufgetreten');
                    return [3 /*break*/, 5];
                case 4:
                    setIsSubmitting(false);
                    return [7 /*endfinally*/];
                case 5: return [2 /*return*/];
            }
        });
    }); };
    var timelineLabels = {
        'one_month': 'In den nächsten 4-6 Wochen',
        'three_months': 'In den nächsten 3 Monaten',
        'six_months': 'In den nächsten 6 Monaten',
        'flexible': 'Flexibel'
    };
    var groupProductsByCategory = function () {
        var grouped = {};
        state.products.forEach(function (product) {
            if (!grouped[product.category]) {
                grouped[product.category] = [];
            }
            grouped[product.category].push({
                name: product.name,
                quantity: product.quantity
            });
        });
        return grouped;
    };
    return (<FunnelStep_1.default title="Zusammenfassung Ihrer Anfrage" subtitle="Überprüfen Sie Ihre Angaben und senden Sie die Anfrage ab" onNext={handleSubmit} onBack={previousStep} isValid={true} isLoading={isSubmitting} currentStep={currentStep} totalSteps={6}>
      <div className="max-w-3xl mx-auto">
        <framer_motion_1.AnimatePresence mode="wait">
          {status === 'success' ? (<framer_motion_1.motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="bg-green-50 border border-green-200 rounded-lg p-8 text-center">
              <span className="text-4xl mb-4 block">✨</span>
              <h3 className="text-xl font-semibold text-green-800 mb-2">
                Vielen Dank für Ihre Anfrage!
              </h3>
              <p className="text-green-600">
                Wir werden uns schnellstmöglich mit Ihnen in Verbindung setzen.
              </p>
            </framer_motion_1.motion.div>) : (<framer_motion_1.motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              {status === 'error' && (<div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
                  <p className="text-red-600 text-center">{errorMessage}</p>
                </div>)}

              <div className="grid gap-6">
                <SummarySection title="Ausgewählte Produkte">
                  <ul className="space-y-3">
                    {Object.entries(groupProductsByCategory()).map(function (_a) {
                var category = _a[0], products = _a[1];
                return (<li key={category} className="pb-3 border-b border-gray-100 last:border-0">
                        <strong className="text-gray-700">{category}:</strong>
                        <div className="mt-1 flex flex-wrap gap-2">
                          {products.map(function (product, idx) { return (<span key={idx} className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600">
                              {product.name} ({product.quantity}x)
                            </span>); })}
                        </div>
                      </li>);
            })}
                  </ul>
                </SummarySection>

                <SummarySection title="Budget">
                  <p className="text-tuscher-blue/70">
                    {parseInt(state.budget).toLocaleString('de-DE')} €
                  </p>
                </SummarySection>

                <SummarySection title="Zeitrahmen">
                  <p className="text-tuscher-blue/70">
                    {timelineLabels[state.timeline] || state.timeline}
                  </p>
                </SummarySection>

                <SummarySection title="Kontaktinformationen">
                  <div className="space-y-2">
                    <p className="text-tuscher-blue/70">
                      <strong>Name:</strong> {state.contact.name}
                    </p>
                    <p className="text-tuscher-blue/70">
                      <strong>Email:</strong> {state.contact.email}
                    </p>
                    {state.contact.phone && (<p className="text-tuscher-blue/70">
                        <strong>Telefon:</strong> {state.contact.phone}
                      </p>)}
                    {state.contact.company && (<p className="text-tuscher-blue/70">
                        <strong>Unternehmen:</strong> {state.contact.company}
                      </p>)}
                  </div>
                </SummarySection>

                <SummarySection title="Zusätzliche Informationen">
                  <div className="space-y-2">
                    {((_a = state.additionalInfo) === null || _a === void 0 ? void 0 : _a.location) && (<p className="text-tuscher-blue/70">
                        <strong>Standort:</strong> {state.additionalInfo.location}
                      </p>)}
                    {((_b = state.additionalInfo) === null || _b === void 0 ? void 0 : _b.livingSituation) && (<p className="text-tuscher-blue/70">
                        <strong>Wohnsituation:</strong> {state.additionalInfo.livingSituation}
                      </p>)}
                    {((_c = state.additionalInfo) === null || _c === void 0 ? void 0 : _c.householdSize) && (<p className="text-tuscher-blue/70">
                        <strong>Haushaltsgröße:</strong> {state.additionalInfo.householdSize}
                      </p>)}
                    {((_d = state.additionalInfo) === null || _d === void 0 ? void 0 : _d.age) && (<p className="text-tuscher-blue/70">
                        <strong>Alter:</strong> {state.additionalInfo.age}
                      </p>)}
                    {((_e = state.additionalInfo) === null || _e === void 0 ? void 0 : _e.gender) && (<p className="text-tuscher-blue/70">
                        <strong>Geschlecht:</strong> {state.additionalInfo.gender}
                      </p>)}
                    {((_f = state.additionalInfo) === null || _f === void 0 ? void 0 : _f.specificRequirements) && (<p className="text-tuscher-blue/70">
                        <strong>Spezielle Anforderungen:</strong> {state.additionalInfo.specificRequirements}
                      </p>)}
                    {((_h = (_g = state.additionalInfo) === null || _g === void 0 ? void 0 : _g.customizationNeeds) === null || _h === void 0 ? void 0 : _h.length) > 0 && (<div className="text-tuscher-blue/70">
                        <strong>Anpassungswünsche:</strong>
                        <div className="flex flex-wrap gap-2 mt-1">
                          {state.additionalInfo.customizationNeeds.map(function (need, idx) { return (<span key={idx} className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600">
                              {need}
                            </span>); })}
                        </div>
                      </div>)}
                    {((_k = (_j = state.additionalInfo) === null || _j === void 0 ? void 0 : _j.preferredFeatures) === null || _k === void 0 ? void 0 : _k.length) > 0 && (<div className="text-tuscher-blue/70">
                        <strong>Gewünschte Eigenschaften:</strong>
                        <div className="flex flex-wrap gap-2 mt-1">
                          {state.additionalInfo.preferredFeatures.map(function (feature, idx) { return (<span key={idx} className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600">
                              {feature}
                            </span>); })}
                        </div>
                      </div>)}
                    {((_l = state.additionalInfo) === null || _l === void 0 ? void 0 : _l.painPoints) && (<p className="text-tuscher-blue/70">
                        <strong>Herausforderungen:</strong> {state.additionalInfo.painPoints}
                      </p>)}
                  </div>
                </SummarySection>
              </div>
            </framer_motion_1.motion.div>)}
        </framer_motion_1.AnimatePresence>
      </div>
    </FunnelStep_1.default>);
};
exports.default = Step6Summary;
