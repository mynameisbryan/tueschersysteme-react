'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var ProductSelection_1 = require("./steps/ProductSelection");
var Budget_1 = require("./steps/Budget");
var Timeline_1 = require("./steps/Timeline");
var AdditionalInfo_1 = require("./steps/AdditionalInfo");
var Contact_1 = require("./steps/Contact");
var Summary_1 = require("./steps/Summary");
var FunnelContext_1 = require("./FunnelContext");
var FunnelContent = function () {
    var currentStep = (0, FunnelContext_1.useFunnel)().currentStep;
    // Add effect to scroll to top on step change
    (0, react_1.useEffect)(function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }, [currentStep]);
    var steps = [
        <ProductSelection_1.default key="step1"/>,
        <Budget_1.default key="step2"/>,
        <Timeline_1.default key="step3"/>,
        <AdditionalInfo_1.default key="step4"/>,
        <Contact_1.default key="step5"/>,
        <Summary_1.default key="step6"/>
    ];
    return (<div className="bg-gray-50">
      <div className="container mx-auto px-4 pt-24">
        {steps[currentStep]}
      </div>
    </div>);
};
var SalesFunnelPage = function () {
    return (<FunnelContext_1.FunnelProvider>
      <FunnelContent />
    </FunnelContext_1.FunnelProvider>);
};
exports.default = SalesFunnelPage;
