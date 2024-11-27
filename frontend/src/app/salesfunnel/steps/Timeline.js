"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var FunnelContext_1 = require("../FunnelContext");
var FunnelStep_1 = require("@/components/salesfunnel/FunnelStep");
var framer_motion_1 = require("framer-motion");
var Step3Timeline = function () {
    var _a = (0, FunnelContext_1.useFunnel)(), state = _a.state, updateState = _a.updateState, nextStep = _a.nextStep, previousStep = _a.previousStep, currentStep = _a.currentStep;
    var _b = (0, react_1.useState)(state.timeline), timeline = _b[0], setTimeline = _b[1];
    var timelines = [
        {
            label: 'Sobald wie möglich',
            value: 'one_month',
            description: 'In den nächsten 4-6 Wochen',
            icon: '🚀'
        },
        {
            label: 'Kurzfristige Planung',
            value: 'three_months',
            description: 'In den nächsten 3 Monaten',
            icon: '📅'
        },
        {
            label: 'Mittelfristige Planung',
            value: 'six_months',
            description: 'In den nächsten 6 Monaten',
            icon: '🗓️'
        },
        {
            label: 'Flexibel',
            value: 'flexible',
            description: 'Zeitpunkt noch nicht festgelegt',
            icon: '⭐'
        }
    ];
    var handleNext = function () {
        updateState({ timeline: timeline });
        nextStep();
    };
    return (<FunnelStep_1.default title="Wann möchten Sie starten?" subtitle="Wählen Sie den gewünschten Zeitrahmen für Ihr Projekt" onNext={handleNext} onBack={previousStep} isValid={!!timeline} currentStep={currentStep} totalSteps={6}>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {timelines.map(function (time) { return (<framer_motion_1.motion.button key={time.value} onClick={function () { return setTimeline(time.value); }} className={"\n              p-6 rounded-lg border-2 text-left transition-all\n              ".concat(timeline === time.value
                ? 'border-tuscher-blue bg-tuscher-blue/5 ring-2 ring-tuscher-blue/20'
                : 'border-gray-200 hover:border-gray-300', "\n            ")} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
            <div className="flex items-start space-x-4">
              <span className="text-2xl">{time.icon}</span>
              <div>
                <h3 className="font-semibold text-lg text-gray-900">
                  {time.label}
                </h3>
                <p className="text-gray-600 text-sm mt-2">
                  {time.description}
                </p>
              </div>
            </div>
          </framer_motion_1.motion.button>); })}
      </div>
    </FunnelStep_1.default>);
};
exports.default = Step3Timeline;
