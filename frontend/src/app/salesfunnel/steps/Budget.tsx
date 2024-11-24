import React, { useState } from 'react';
import { useFunnel } from '../FunnelContext';
import FunnelStep from '@/components/salesfunnel/FunnelStep';

const BUDGET_RANGES = [
  { min: 1000, max: 5000, label: 'Basis' },
  { min: 5000, max: 15000, label: 'Standard' },
  { min: 15000, max: 30000, label: 'Premium' },
  { min: 30000, max: 50000, label: 'Luxus' },
];

const Step2Budget = () => {
  const { state, updateState, nextStep, previousStep, currentStep } = useFunnel();
  const [budget, setBudget] = useState(state.budget || '5000');
  const [hoveredValue, setHoveredValue] = useState<string | null>(null);

  const handleNext = () => {
    updateState({ budget });
    nextStep();
  };

  const currentRange = BUDGET_RANGES.find(
    range => parseInt(budget) >= range.min && parseInt(budget) <= range.max
  );

  return (
    <FunnelStep
      title="Wählen Sie Ihr Budget"
      subtitle="Verschieben Sie den Regler, um Ihr gewünschtes Budget festzulegen"
      onNext={handleNext}
      onBack={previousStep}
      isValid={!!budget}
      currentStep={currentStep}
      totalSteps={5}
    >
      <div className="space-y-8">
        <div className="relative pt-8">
          <input
            type="range"
            min="1000"
            max="50000"
            step="1000"
            value={budget}
            onChange={(e) => setBudget(e.target.value)}
            onMouseMove={(e) => {
              const rect = e.currentTarget.getBoundingClientRect();
              const pos = (e.clientX - rect.left) / rect.width;
              setHoveredValue(Math.round(pos * 49000 + 1000).toString());
            }}
            onMouseLeave={() => setHoveredValue(null)}
            className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer"
          />
          <div className="absolute -top-2 left-0 right-0 flex justify-between text-xs text-gray-500">
            {BUDGET_RANGES.map(range => (
              <span key={range.label}>{range.label}</span>
            ))}
          </div>
        </div>

        <div className="text-center">
          <span className="text-3xl font-bold text-tuscher-blue">
            {parseInt(hoveredValue || budget).toLocaleString('de-DE')} €
          </span>
          {currentRange && (
            <p className="text-gray-600 mt-2">{currentRange.label}-Paket</p>
          )}
        </div>
      </div>
    </FunnelStep>
  );
};

export default Step2Budget;
  