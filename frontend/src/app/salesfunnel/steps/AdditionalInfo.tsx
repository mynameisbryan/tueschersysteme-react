import React, { useState } from 'react';
import { useFunnel } from '../FunnelContext';
import FunnelStep from '@/components/salesfunnel/FunnelStep';
import { motion } from 'framer-motion';

const InputField = ({ 
  id, 
  label, 
  value, 
  onChange,
  placeholder,
  multiline = false
}: {
  id: string;
  label: string;
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  multiline?: boolean;
}) => (
  <div className="relative space-y-1">
    <label htmlFor={id} className="block text-xs sm:text-sm font-medium text-tuscher-blue">
      {label}
    </label>
    {multiline ? (
      <textarea
        id={id}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="block w-full rounded-lg border-2 border-tuscher-blue/20 
                 bg-white/80 py-2 px-3 text-xs sm:text-sm text-tuscher-blue min-h-[80px]
                 focus:border-tuscher-cyan focus:ring-tuscher-cyan/30
                 placeholder:text-gray-400 placeholder:text-xs sm:placeholder:text-sm"
      />
    ) : (
      <input
        type="text"
        id={id}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="block w-full rounded-lg border-2 border-tuscher-blue/20 
                 bg-white/80 py-2 px-3 text-xs sm:text-sm text-tuscher-blue
                 focus:border-tuscher-cyan focus:ring-tuscher-cyan/30
                 placeholder:text-gray-400 placeholder:text-xs sm:placeholder:text-sm"
      />
    )}
  </div>
);

const MultiSelectCard = ({ 
  selected, 
  onClick, 
  icon, 
  label, 
  multiSelect = false
}: {
  selected: boolean;
  onClick: () => void;
  icon: string;
  label: string;
  multiSelect?: boolean;
}) => (
  <motion.button
    onClick={onClick}
    className={`
      transition-all rounded-lg border-2 relative
      ${selected 
        ? 'border-tuscher-blue bg-tuscher-blue/5' 
        : 'border-gray-200 hover:border-gray-300'
      }
      sm:p-4 sm:h-auto sm:text-left sm:flex sm:items-center sm:w-full
      p-2 h-14 w-full text-center flex flex-col items-center justify-center
    `}
    whileHover={{ scale: 1.02 }}
    whileTap={{ scale: 0.98 }}
  >
    <span className="text-base text-tuscher-blue/70 mb-0.5">{icon}</span>
    <span className="font-medium text-gray-900 text-[11px] leading-tight sm:text-base">
      {label}
    </span>
  </motion.button>
);

const Step4AdditionalInfo = () => {
  const { state, updateState, nextStep, previousStep, currentStep } = useFunnel();
  const [additionalInfo, setAdditionalInfo] = useState(state.additionalInfo || {
    location: '',
    householdSize: '',
    livingSituation: '',
    specificRequirements: '',
    customizationNeeds: [],
    preferredFeatures: [],
    painPoints: ''
  });

  const livingSituations = [
    { value: 'Mietwohnung', label: 'Mietwohnung', icon: '🏢' },
    { value: 'Eigentumswohnung', label: 'Eigentumswohnung', icon: '🏠' },
    { value: 'Haus', label: 'Haus', icon: '🏡' },
    { value: 'Gewerbe', label: 'Gewerbe', icon: '🏭' }
  ];

  const customizationOptions = [
    { value: 'Spezielle Größen', icon: '📏' },
    { value: 'Sonderanfertigungen', icon: '🛠️' },
    { value: 'Individuelle Farben', icon: '🎨' },
    { value: 'Maßgeschneiderte Lösungen', icon: '✨' }
  ];

  const featureOptions = [
    { value: 'Nachhaltigkeit', icon: '🌱' },
    { value: 'Pflegeleicht', icon: '🧹' },
    { value: 'Langlebigkeit', icon: '⭐' },
    { value: 'Energieeffizienz', icon: '💡' }
  ];

  const isValid = additionalInfo.location.trim().length > 0;

  const handleNext = () => {
    if (!isValid) return;
    console.log('Additional info before update:', additionalInfo);
    updateState({ additionalInfo });
    nextStep();
  };

  return (
    <FunnelStep
      title="Zusätzliche Informationen"
      subtitle="Helfen Sie uns, Ihre Anforderungen besser zu verstehen"
      onNext={handleNext}
      onBack={previousStep}
      isValid={isValid}
      currentStep={currentStep}
      totalSteps={6}
    >
      <motion.div 
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="glass-card max-w-2xl mx-auto space-y-8"
      >
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <InputField
            id="location"
            label="Standort *"
            value={additionalInfo.location}
            onChange={(value) => setAdditionalInfo(prev => ({ ...prev, location: value }))}
            placeholder="PLZ oder Ort"
          />
          <InputField
            id="householdSize"
            label="Haushaltsgröße"
            value={additionalInfo.householdSize}
            onChange={(value) => setAdditionalInfo(prev => ({ ...prev, householdSize: value }))}
            placeholder="Anzahl der Personen"
          />
        </div>

        <div className="space-y-3">
          <label className="block text-sm font-medium text-tuscher-blue">
            Wohnsituation
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-2 gap-2 sm:gap-3">
            {livingSituations.map((situation) => (
              <MultiSelectCard
                key={situation.value}
                selected={additionalInfo.livingSituation === situation.value}
                onClick={() => setAdditionalInfo(prev => ({ 
                  ...prev, 
                  livingSituation: situation.value 
                }))}
                icon={situation.icon}
                label={situation.label}
              />
            ))}
          </div>
        </div>

        <InputField
          id="specificRequirements"
          label="Spezielle Anforderungen"
          value={additionalInfo.specificRequirements}
          onChange={(value) => setAdditionalInfo(prev => ({ ...prev, specificRequirements: value }))}
          multiline
          placeholder="Nennen Sie Anforderungen wie z.B. spezielles Gewebe, besondere Einbausituation,..."
        />

        <div className="space-y-3">
          <label className="block text-sm font-medium text-tuscher-blue">
            Anpassungswünsche
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-2 gap-2 sm:gap-3">
            {customizationOptions.map((option) => (
              <MultiSelectCard
                key={option.value}
                selected={additionalInfo.customizationNeeds?.includes(option.value)}
                onClick={() => {
                  const needs = additionalInfo.customizationNeeds || [];
                  setAdditionalInfo(prev => ({
                    ...prev,
                    customizationNeeds: needs.includes(option.value)
                      ? needs.filter(need => need !== option.value)
                      : [...needs, option.value]
                  }));
                }}
                icon={option.icon}
                label={option.value}
                multiSelect
              />
            ))}
          </div>
        </div>

        <div className="space-y-3">
          <label className="block text-sm font-medium text-tuscher-blue">
            Gewünschte Eigenschaften
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-2 gap-2 sm:gap-3">
            {featureOptions.map((feature) => (
              <MultiSelectCard
                key={feature.value}
                selected={additionalInfo.preferredFeatures?.includes(feature.value)}
                onClick={() => {
                  const features = additionalInfo.preferredFeatures || [];
                  setAdditionalInfo(prev => ({
                    ...prev,
                    preferredFeatures: features.includes(feature.value)
                      ? features.filter(f => f !== feature.value)
                      : [...features, feature.value]
                  }));
                }}
                icon={feature.icon}
                label={feature.value}
                multiSelect
              />
            ))}
          </div>
        </div>

        <InputField
          id="painPoints"
          label="Herausforderungen"
          value={additionalInfo.painPoints}
          onChange={(value) => setAdditionalInfo(prev => ({ ...prev, painPoints: value }))}
          multiline
          placeholder="Nennen Sie Herausforderungen wie wenig Platz, geringer Abstand zum Rolladen, bestimmte Fenstermaterialien,..."
        />
      </motion.div>
    </FunnelStep>
  );
};

export default Step4AdditionalInfo; 