'use client';

import React, { createContext, useContext, useState } from 'react';
import { SalesFunnelFormData } from '@/types/sales-funnel';

interface FunnelContextType {
  state: SalesFunnelFormData;
  currentStep: number;
  updateState: (update: Partial<SalesFunnelFormData>) => void;
  nextStep: () => void;
  previousStep: () => void;
  isLastStep: () => boolean;
}

const FunnelContext = createContext<FunnelContextType | undefined>(undefined);

export const useFunnel = () => {
  const context = useContext(FunnelContext);
  if (!context) {
    throw new Error('useFunnel must be used within a FunnelProvider');
  }
  return context;
};

export const FunnelProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, setState] = useState<SalesFunnelFormData>({
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
  });

  console.log('[FunnelContext] Current State:', state);

  const [currentStep, setCurrentStep] = useState(0);
  const TOTAL_STEPS = 6;

  const updateState = (update: Partial<SalesFunnelFormData>) => {
    setState(prev => ({ ...prev, ...update }));
  };

  const nextStep = () => {
    if (currentStep < TOTAL_STEPS - 1) {
      console.log('[FunnelContext] Moving to next step:', currentStep + 1);
      setCurrentStep(prev => prev + 1);
    }
  };

  const previousStep = () => {
    if (currentStep > 0) {
      console.log('[FunnelContext] Moving to previous step:', currentStep - 1);
      setCurrentStep(prev => prev - 1);
    }
  };

  const isLastStep = () => currentStep === TOTAL_STEPS - 1;

  return (
    <FunnelContext.Provider 
      value={{ 
        state, 
        currentStep, 
        updateState, 
        nextStep, 
        previousStep, 
        isLastStep 
      }}
    >
      {children}
    </FunnelContext.Provider>
  );
};
