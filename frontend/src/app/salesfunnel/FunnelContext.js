'use client';
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
Object.defineProperty(exports, "__esModule", { value: true });
exports.FunnelProvider = exports.useFunnel = void 0;
var react_1 = require("react");
var FunnelContext = (0, react_1.createContext)(undefined);
var useFunnel = function () {
    var context = (0, react_1.useContext)(FunnelContext);
    if (!context) {
        throw new Error('useFunnel must be used within a FunnelProvider');
    }
    return context;
};
exports.useFunnel = useFunnel;
var FunnelProvider = function (_a) {
    var children = _a.children;
    var _b = (0, react_1.useState)({
        products: [],
        budget: '',
        timeline: '',
        additionalInfo: {
            location: '',
            householdSize: '',
            livingSituation: '',
            specificRequirements: '',
            customizationNeeds: [],
            preferredFeatures: [],
            painPoints: ''
        },
        contact: {
            name: '',
            email: '',
            phone: '',
            company: ''
        }
    }), state = _b[0], setState = _b[1];
    console.log('[FunnelContext] Current State:', state);
    var _c = (0, react_1.useState)(0), currentStep = _c[0], setCurrentStep = _c[1];
    var TOTAL_STEPS = 6;
    var updateState = function (update) {
        setState(function (prev) { return (__assign(__assign({}, prev), update)); });
    };
    var nextStep = function () {
        if (currentStep < TOTAL_STEPS - 1) {
            console.log('[FunnelContext] Moving to next step:', currentStep + 1);
            setCurrentStep(function (prev) { return prev + 1; });
        }
    };
    var previousStep = function () {
        if (currentStep > 0) {
            console.log('[FunnelContext] Moving to previous step:', currentStep - 1);
            setCurrentStep(function (prev) { return prev - 1; });
        }
    };
    var isLastStep = function () { return currentStep === TOTAL_STEPS - 1; };
    return (<FunnelContext.Provider value={{
            state: state,
            currentStep: currentStep,
            updateState: updateState,
            nextStep: nextStep,
            previousStep: previousStep,
            isLastStep: isLastStep
        }}>
      {children}
    </FunnelContext.Provider>);
};
exports.FunnelProvider = FunnelProvider;
