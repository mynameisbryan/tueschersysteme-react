"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// frontend/src/components/salesfunnel/FunnelStep.tsx
var react_1 = require("react");
var FunnelProgress_1 = require("@/app/salesfunnel/FunnelProgress");
function FunnelStep(_a) {
    var title = _a.title, subtitle = _a.subtitle, children = _a.children, onNext = _a.onNext, onBack = _a.onBack, _b = _a.isValid, isValid = _b === void 0 ? true : _b, _c = _a.isLoading, isLoading = _c === void 0 ? false : _c, currentStep = _a.currentStep, totalSteps = _a.totalSteps, _d = _a.className, className = _d === void 0 ? '' : _d;
    var steps = ['Produkte', 'Budget', 'Zeitplan', 'Kontakt', 'Übersicht'];
    (0, react_1.useEffect)(function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }, []);
    return (<div className={"container mx-auto px-4 py-8 ".concat(className)}>
      <FunnelProgress_1.default steps={steps} currentStep={currentStep}/>
      
      <div className="bg-white rounded-lg shadow-lg p-8">
        <h2 className="text-2xl font-bold text-gray-800 text-center mb-2">{title}</h2>
        {subtitle && (<p className="text-center text-gray-600 mb-8">{subtitle}</p>)}
        
        <div className="space-y-6">
          {children}
        </div>
        
        <div className="flex justify-between mt-8 pt-6 border-t">
          {onBack && (<button onClick={onBack} className="px-6 py-2 text-gray-600 hover:text-gray-800 transition-colors" disabled={isLoading}>
              ← Zurück
            </button>)}
          {onNext && (<button onClick={onNext} className={"px-6 py-2 rounded-full transition-all ".concat(isValid
                ? 'bg-tuscher-blue text-white hover:bg-tuscher-blue/90'
                : 'bg-gray-200 text-gray-400 cursor-not-allowed')} disabled={!isValid || isLoading}>
              {isLoading ? 'Wird geladen...' : currentStep === totalSteps - 1 ? 'Absenden' : 'Weiter →'}
            </button>)}
        </div>
      </div>
    </div>);
}
exports.default = FunnelStep;
