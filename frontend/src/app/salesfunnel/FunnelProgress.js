"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function FunnelProgress(_a) {
    var steps = _a.steps, currentStep = _a.currentStep;
    var progressSteps = [
        'Produkte',
        'Budget',
        'Zeitrahmen',
        'Zusätzliche Infos',
        'Kontakt',
        'Zusammenfassung'
    ];
    return (<div className="container mx-auto px-4 mb-6">
        <div className="max-w-3xl mx-auto">
          {/* Mobile Progress (Shows only current step/total) */}
          <div className="md:hidden text-center text-sm text-tuscher-blue/70 mb-2">
            Schritt {currentStep + 1} von {progressSteps.length}
          </div>

          {/* Desktop Progress Bar */}
          <div className="hidden md:flex justify-between items-center">
            {progressSteps.map(function (step, index) { return (<div key={index} className="flex items-center flex-1">
                {/* Step Circle */}
                <div className="flex flex-col items-center relative group">
                  <div className={"\n                    w-6 h-6 rounded-full flex items-center justify-center text-xs font-medium\n                    transition-all duration-300\n                    ".concat(index === currentStep
                ? 'bg-tuscher-blue text-white scale-110'
                : index < currentStep
                    ? 'bg-tuscher-cyan/20 text-tuscher-blue'
                    : 'bg-gray-100 text-gray-400', "\n                  ")}>
                    {index + 1}
                  </div>
                  
                  {/* Step Label */}
                  <div className={"\n                    absolute -bottom-6 whitespace-nowrap text-xs\n                    transition-all duration-300\n                    ".concat(index === currentStep
                ? 'text-tuscher-blue font-medium'
                : index < currentStep
                    ? 'text-tuscher-blue/70'
                    : 'text-gray-400', "\n                  ")}>
                    {step}
                  </div>
                </div>

                {/* Connector Line */}
                {index < progressSteps.length - 1 && (<div className="flex-1 mx-2">
                    <div className={"\n                      h-0.5 w-full\n                      transition-all duration-300\n                      ".concat(index < currentStep
                    ? 'bg-tuscher-blue'
                    : 'bg-gray-200', "\n                    ")}/>
                  </div>)}
              </div>); })}
          </div>

          {/* Progress Bar */}
          <div className="h-1 bg-gray-100 rounded-full mt-8 md:mt-10">
            <div className="h-full bg-tuscher-blue rounded-full transition-all duration-500" style={{
            width: "".concat((currentStep / (progressSteps.length - 1)) * 100, "%")
        }}/>
          </div>
        </div>
      </div>);
}
exports.default = FunnelProgress;
