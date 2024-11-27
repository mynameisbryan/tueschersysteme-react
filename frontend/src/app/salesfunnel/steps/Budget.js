"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var FunnelContext_1 = require("../FunnelContext");
var FunnelStep_1 = require("@/components/salesfunnel/FunnelStep");
var BUDGET_RANGES = [
    { min: 1000, max: 5000, label: 'Basis' },
    { min: 5000, max: 15000, label: 'Standard' },
    { min: 15000, max: 30000, label: 'Premium' },
    { min: 30000, max: 50000, label: 'Luxus' },
];
var Step2Budget = function () {
    var _a = (0, FunnelContext_1.useFunnel)(), state = _a.state, updateState = _a.updateState, nextStep = _a.nextStep, previousStep = _a.previousStep, currentStep = _a.currentStep;
    var _b = (0, react_1.useState)(state.budget || '5000'), budget = _b[0], setBudget = _b[1];
    var _c = (0, react_1.useState)(null), hoveredValue = _c[0], setHoveredValue = _c[1];
    var handleNext = function () {
        updateState({ budget: budget });
        nextStep();
    };
    var currentRange = BUDGET_RANGES.find(function (range) { return parseInt(budget) >= range.min && parseInt(budget) <= range.max; });
    return (<FunnelStep_1.default title="Wählen Sie Ihr Budget" subtitle="Verschieben Sie den Regler, um Ihr gewünschtes Budget festzulegen" onNext={handleNext} onBack={previousStep} isValid={!!budget} currentStep={currentStep} totalSteps={5}>
      <div className="space-y-8">
        <div className="relative pt-8">
          <input type="range" min="1000" max="50000" step="1000" value={budget} onChange={function (e) { return setBudget(e.target.value); }} onMouseMove={function (e) {
            var rect = e.currentTarget.getBoundingClientRect();
            var pos = (e.clientX - rect.left) / rect.width;
            setHoveredValue(Math.round(pos * 49000 + 1000).toString());
        }} onMouseLeave={function () { return setHoveredValue(null); }} className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer"/>
          <div className="absolute -top-2 left-0 right-0 flex justify-between text-xs text-gray-500">
            {BUDGET_RANGES.map(function (range) { return (<span key={range.label}>{range.label}</span>); })}
          </div>
        </div>

        <div className="text-center">
          <span className="text-3xl font-bold text-tuscher-blue">
            {parseInt(hoveredValue || budget).toLocaleString('de-DE')} €
          </span>
          {currentRange && (<p className="text-gray-600 mt-2">{currentRange.label}-Paket</p>)}
        </div>
      </div>
    </FunnelStep_1.default>);
};
exports.default = Step2Budget;
