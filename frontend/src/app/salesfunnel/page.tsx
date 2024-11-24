'use client';

import React from 'react';
import Step1ProductSelection from './steps/ProductSelection';
import Step2Budget from './steps/Budget';
import Step3Timeline from './steps/Timeline';
import Step4Contact from './steps/Contact';
import Step5Summary from './steps/Summary';
import { FunnelProvider, useFunnel } from './FunnelContext';

const FunnelContent = () => {
  const { currentStep } = useFunnel();
  const steps = [
    <Step1ProductSelection key="step1" />,
    <Step2Budget key="step2" />,
    <Step3Timeline key="step3" />,
    <Step4Contact key="step4" />,
    <Step5Summary key="step5" />,
  ];

  return (
    <div className="pt-24 min-h-screen bg-gray-50">
      <div className="container mx-auto px-4">
        {steps[currentStep]}
      </div>
    </div>
  );
};

const SalesFunnelPage = () => {
  return (
    <FunnelProvider>
      <FunnelContent />
    </FunnelProvider>
  );
};

export default SalesFunnelPage;
