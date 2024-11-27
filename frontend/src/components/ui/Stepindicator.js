"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.StepIndicator = void 0;
// frontend/src/components/ui/StepIndicator.tsx
function StepIndicator(_a) {
    var steps = _a.steps, currentStep = _a.currentStep;
    return (<div className="flex items-center justify-center space-x-4">
        {steps.map(function (step, index) { return (<div key={index} className={"\n            flex items-center\n            ".concat(index <= currentStep ? 'text-tuscher-blue' : 'text-gray-400', "\n          ")}>
            <div className={"\n              w-8 h-8 rounded-full flex items-center justify-center\n              ".concat(index === currentStep ? 'bg-tuscher-blue text-white' :
                index < currentStep ? 'bg-tuscher-cyan/20' : 'bg-gray-200', "\n            ")}>
              {index + 1}
            </div>
            {index < steps.length - 1 && (<div className={"\n                w-12 h-0.5 mx-2\n                ".concat(index < currentStep ? 'bg-tuscher-blue' : 'bg-gray-200', "\n              ")}/>)}
          </div>); })}
      </div>);
}
exports.StepIndicator = StepIndicator;
