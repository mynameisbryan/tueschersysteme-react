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
var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var FunnelContext_1 = require("../FunnelContext");
var FunnelStep_1 = require("@/components/salesfunnel/FunnelStep");
var framer_motion_1 = require("framer-motion");
var InputField = function (_a) {
    var id = _a.id, label = _a.label, value = _a.value, onChange = _a.onChange, placeholder = _a.placeholder, _b = _a.multiline, multiline = _b === void 0 ? false : _b;
    return (<div className="relative space-y-1">
    <label htmlFor={id} className="block text-xs sm:text-sm font-medium text-tuscher-blue">
      {label}
    </label>
    {multiline ? (<textarea id={id} value={value} onChange={function (e) { return onChange(e.target.value); }} placeholder={placeholder} className="block w-full rounded-lg border-2 border-tuscher-blue/20 
                 bg-white/80 py-2 px-3 text-xs sm:text-sm text-tuscher-blue min-h-[80px]
                 focus:border-tuscher-cyan focus:ring-tuscher-cyan/30
                 placeholder:text-gray-400 placeholder:text-xs sm:placeholder:text-sm"/>) : (<input type="text" id={id} value={value} onChange={function (e) { return onChange(e.target.value); }} placeholder={placeholder} className="block w-full rounded-lg border-2 border-tuscher-blue/20 
                 bg-white/80 py-2 px-3 text-xs sm:text-sm text-tuscher-blue
                 focus:border-tuscher-cyan focus:ring-tuscher-cyan/30
                 placeholder:text-gray-400 placeholder:text-xs sm:placeholder:text-sm"/>)}
  </div>);
};
var MultiSelectCard = function (_a) {
    var selected = _a.selected, onClick = _a.onClick, icon = _a.icon, label = _a.label, _b = _a.multiSelect, multiSelect = _b === void 0 ? false : _b;
    return (<framer_motion_1.motion.button onClick={onClick} className={"\n      transition-all rounded-lg border-2 relative\n      ".concat(selected
            ? 'border-tuscher-blue bg-tuscher-blue/5'
            : 'border-gray-200 hover:border-gray-300', "\n      sm:p-4 sm:h-auto sm:text-left sm:flex sm:items-center sm:w-full\n      p-2 h-14 w-full text-center flex flex-col items-center justify-center\n    ")} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
    <span className="text-base text-tuscher-blue/70 mb-0.5">{icon}</span>
    <span className="font-medium text-gray-900 text-[11px] leading-tight sm:text-base">
      {label}
    </span>
  </framer_motion_1.motion.button>);
};
var Step4AdditionalInfo = function () {
    var _a = (0, FunnelContext_1.useFunnel)(), state = _a.state, updateState = _a.updateState, nextStep = _a.nextStep, previousStep = _a.previousStep, currentStep = _a.currentStep;
    var _b = (0, react_1.useState)(state.additionalInfo || {
        location: '',
        householdSize: '',
        livingSituation: '',
        specificRequirements: '',
        customizationNeeds: [],
        preferredFeatures: [],
        painPoints: ''
    }), additionalInfo = _b[0], setAdditionalInfo = _b[1];
    var livingSituations = [
        { value: 'Mietwohnung', label: 'Mietwohnung', icon: '🏢' },
        { value: 'Eigentumswohnung', label: 'Eigentumswohnung', icon: '🏠' },
        { value: 'Haus', label: 'Haus', icon: '🏡' },
        { value: 'Gewerbe', label: 'Gewerbe', icon: '🏭' }
    ];
    var customizationOptions = [
        { value: 'Spezielle Größen', icon: '📏' },
        { value: 'Sonderanfertigungen', icon: '🛠️' },
        { value: 'Individuelle Farben', icon: '🎨' },
        { value: 'Maßgeschneiderte Lösungen', icon: '✨' }
    ];
    var featureOptions = [
        { value: 'Nachhaltigkeit', icon: '🌱' },
        { value: 'Pflegeleicht', icon: '🧹' },
        { value: 'Langlebigkeit', icon: '⭐' },
        { value: 'Energieeffizienz', icon: '💡' }
    ];
    var isValid = additionalInfo.location.trim().length > 0;
    var handleNext = function () {
        if (!isValid)
            return;
        console.log('Additional info before update:', additionalInfo);
        updateState({ additionalInfo: additionalInfo });
        nextStep();
    };
    return (<FunnelStep_1.default title="Zusätzliche Informationen" subtitle="Helfen Sie uns, Ihre Anforderungen besser zu verstehen" onNext={handleNext} onBack={previousStep} isValid={isValid} currentStep={currentStep} totalSteps={6}>
      <framer_motion_1.motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="glass-card max-w-2xl mx-auto space-y-8">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <InputField id="location" label="Standort *" value={additionalInfo.location} onChange={function (value) { return setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { location: value })); }); }} placeholder="PLZ oder Ort"/>
          <InputField id="householdSize" label="Haushaltsgröße" value={additionalInfo.householdSize} onChange={function (value) { return setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { householdSize: value })); }); }} placeholder="Anzahl der Personen"/>
        </div>

        <div className="space-y-3">
          <label className="block text-sm font-medium text-tuscher-blue">
            Wohnsituation
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-2 gap-2 sm:gap-3">
            {livingSituations.map(function (situation) { return (<MultiSelectCard key={situation.value} selected={additionalInfo.livingSituation === situation.value} onClick={function () { return setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { livingSituation: situation.value })); }); }} icon={situation.icon} label={situation.label}/>); })}
          </div>
        </div>

        <InputField id="specificRequirements" label="Spezielle Anforderungen" value={additionalInfo.specificRequirements} onChange={function (value) { return setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { specificRequirements: value })); }); }} multiline placeholder="Nennen Sie Anforderungen wie z.B. spezielles Gewebe, besondere Einbausituation,..."/>

        <div className="space-y-3">
          <label className="block text-sm font-medium text-tuscher-blue">
            Anpassungswünsche
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-2 gap-2 sm:gap-3">
            {customizationOptions.map(function (option) {
            var _a;
            return (<MultiSelectCard key={option.value} selected={(_a = additionalInfo.customizationNeeds) === null || _a === void 0 ? void 0 : _a.includes(option.value)} onClick={function () {
                    var needs = additionalInfo.customizationNeeds || [];
                    setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { customizationNeeds: needs.includes(option.value)
                            ? needs.filter(function (need) { return need !== option.value; })
                            : __spreadArray(__spreadArray([], needs, true), [option.value], false) })); });
                }} icon={option.icon} label={option.value} multiSelect/>);
        })}
          </div>
        </div>

        <div className="space-y-3">
          <label className="block text-sm font-medium text-tuscher-blue">
            Gewünschte Eigenschaften
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-2 gap-2 sm:gap-3">
            {featureOptions.map(function (feature) {
            var _a;
            return (<MultiSelectCard key={feature.value} selected={(_a = additionalInfo.preferredFeatures) === null || _a === void 0 ? void 0 : _a.includes(feature.value)} onClick={function () {
                    var features = additionalInfo.preferredFeatures || [];
                    setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { preferredFeatures: features.includes(feature.value)
                            ? features.filter(function (f) { return f !== feature.value; })
                            : __spreadArray(__spreadArray([], features, true), [feature.value], false) })); });
                }} icon={feature.icon} label={feature.value} multiSelect/>);
        })}
          </div>
        </div>

        <InputField id="painPoints" label="Herausforderungen" value={additionalInfo.painPoints} onChange={function (value) { return setAdditionalInfo(function (prev) { return (__assign(__assign({}, prev), { painPoints: value })); }); }} multiline placeholder="Nennen Sie Herausforderungen wie wenig Platz, geringer Abstand zum Rolladen, bestimmte Fenstermaterialien,..."/>
      </framer_motion_1.motion.div>
    </FunnelStep_1.default>);
};
exports.default = Step4AdditionalInfo;
