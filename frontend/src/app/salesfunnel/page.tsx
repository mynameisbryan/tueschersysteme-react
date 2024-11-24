'use client';

import React, { useEffect } from 'react';
import Step1ProductSelection from './steps/ProductSelection';
import Step2Budget from './steps/Budget';
import Step3Timeline from './steps/Timeline';
import Step4AdditionalInfo from './steps/AdditionalInfo';
import Step5Contact from './steps/Contact';
import Step6Summary from './steps/Summary';
import { FunnelProvider, useFunnel } from './FunnelContext';

const FunnelContent = () => {
  const { currentStep } = useFunnel();
  
  // Add effect to scroll to top on step change
  useEffect(() => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }, [currentStep]);

  const steps = [
    <Step1ProductSelection key="step1" />,
    <Step2Budget key="step2" />,
    <Step3Timeline key="step3" />,
    <Step4AdditionalInfo key="step4" />,
    <Step5Contact key="step5" />,
    <Step6Summary key="step6" />
  ];

  return (
    <div className="bg-gray-50">
      <div className="container mx-auto px-4 pt-24">
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
