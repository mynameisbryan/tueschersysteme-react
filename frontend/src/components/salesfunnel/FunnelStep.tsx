// frontend/src/components/salesfunnel/FunnelStep.tsx
import { PropsWithChildren, useEffect } from 'react';
import FunnelProgress from '@/app/salesfunnel/FunnelProgress';

interface FunnelStepProps extends PropsWithChildren {
  title: string;
  subtitle?: string;
  onNext?: () => void;
  onBack?: () => void;
  isValid?: boolean;
  isLoading?: boolean;
  currentStep: number;
  totalSteps: number;
  className?: string;
}

export default function FunnelStep({
  title,
  subtitle,
  children,
  onNext,
  onBack,
  isValid = true,
  isLoading = false,
  currentStep,
  totalSteps,
  className = ''
}: FunnelStepProps) {
  const steps = ['Produkte', 'Budget', 'Zeitplan', 'Kontakt', 'Übersicht'];

  useEffect(() => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }, []);

  return (
    <div className={`container mx-auto px-4 py-8 ${className}`}>
      <FunnelProgress steps={steps} currentStep={currentStep} />
      
      <div className="bg-white rounded-lg shadow-lg p-8">
        <h2 className="text-2xl font-bold text-gray-800 text-center mb-2">{title}</h2>
        {subtitle && (
          <p className="text-center text-gray-600 mb-8">{subtitle}</p>
        )}
        
        <div className="space-y-6">
          {children}
        </div>
        
        <div className="flex justify-between mt-8 pt-6 border-t">
          {onBack && (
            <button 
              onClick={onBack}
              className="px-6 py-2 text-gray-600 hover:text-gray-800 transition-colors"
              disabled={isLoading}
            >
              ← Zurück
            </button>
          )}
          {onNext && (
            <button
              onClick={onNext}
              className={`px-6 py-2 rounded-full transition-all ${
                isValid 
                  ? 'bg-tuscher-blue text-white hover:bg-tuscher-blue/90'
                  : 'bg-gray-200 text-gray-400 cursor-not-allowed'
              }`}
              disabled={!isValid || isLoading}
            >
              {isLoading ? 'Wird geladen...' : currentStep === totalSteps - 1 ? 'Absenden' : 'Weiter →'}
            </button>
          )}
        </div>
      </div>
    </div>
  );
}