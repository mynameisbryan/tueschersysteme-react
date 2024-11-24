import React, { useState } from 'react';
import { useFunnel } from '../FunnelContext';
import FunnelStep from '@/components/salesfunnel/FunnelStep';
import { motion } from 'framer-motion';

const Step3Timeline = () => {
  const { state, updateState, nextStep, previousStep, currentStep } = useFunnel();
  const [timeline, setTimeline] = useState(state.timeline);

  const timelines = [
    { 
      label: 'Sobald wie möglich',
      value: 'one_month',
      description: 'In den nächsten 4-6 Wochen',
      icon: '🚀'
    },
    { 
      label: 'Kurzfristige Planung',
      value: 'three_months',
      description: 'In den nächsten 3 Monaten',
      icon: '📅'
    },
    { 
      label: 'Mittelfristige Planung',
      value: 'six_months',
      description: 'In den nächsten 6 Monaten',
      icon: '🗓️'
    },
    { 
      label: 'Flexibel',
      value: 'flexible',
      description: 'Zeitpunkt noch nicht festgelegt',
      icon: '⭐'
    }
  ];

  const handleNext = () => {
    updateState({ timeline });
    nextStep();
  };

  return (
    <FunnelStep
      title="Wann möchten Sie starten?"
      subtitle="Wählen Sie den gewünschten Zeitrahmen für Ihr Projekt"
      onNext={handleNext}
      onBack={previousStep}
      isValid={!!timeline}
      currentStep={currentStep}
      totalSteps={6}
    >
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {timelines.map((time) => (
          <motion.button
            key={time.value}
            onClick={() => setTimeline(time.value)}
            className={`
              p-6 rounded-lg border-2 text-left transition-all
              ${timeline === time.value 
                ? 'border-tuscher-blue bg-tuscher-blue/5 ring-2 ring-tuscher-blue/20' 
                : 'border-gray-200 hover:border-gray-300'
              }
            `}
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
          >
            <div className="flex items-start space-x-4">
              <span className="text-2xl">{time.icon}</span>
              <div>
                <h3 className="font-semibold text-lg text-gray-900">
                  {time.label}
                </h3>
                <p className="text-gray-600 text-sm mt-2">
                  {time.description}
                </p>
              </div>
            </div>
          </motion.button>
        ))}
      </div>
    </FunnelStep>
  );
};

export default Step3Timeline;
