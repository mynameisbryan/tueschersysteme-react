import React, { useState } from 'react';
import { useFunnel } from '../FunnelContext';
import FunnelStep from '@/components/salesfunnel/FunnelStep';
import { motion } from 'framer-motion';

interface ContactForm {
  name: string;
  email: string;
  phone: string;
  company: string;
  wantContact: boolean;
  method?: 'phone' | 'email';
  time?: string;
  privacy: boolean;
  newsletter?: boolean;
}

const InputField = ({ 
  id, 
  label, 
  type = 'text', 
  value, 
  onChange,
  error = '', 
  required = false 
}: {
  id: keyof ContactForm;
  label: string;
  type?: string;
  value: string;
  onChange: (value: string) => void;
  error?: string;
  required?: boolean;
}) => (
  <div className="relative mb-6">
    <input
      type={type}
      id={id}
      value={value}
      onChange={(e) => onChange(e.target.value)}
      className={`peer block w-full rounded border-2 ${
        error ? 'border-red-500' : 'border-tuscher-blue/20'
      } bg-white/80 py-3 px-4 text-tuscher-blue placeholder-transparent
        focus:border-tuscher-cyan focus:outline-none focus:ring-0`}
      placeholder={label}
      required={required}
    />
    <label
      htmlFor={id}
      className={`absolute -top-2.5 left-3 bg-white px-1 text-sm 
        ${error ? 'text-red-500' : 'text-tuscher-blue/70'}`}
    >
      {label}{required && '*'}
    </label>
    {error && <p className="mt-1 text-sm text-red-500">{error}</p>}
  </div>
);

const Step5Contact = () => {
  const { state, updateState, nextStep, previousStep, currentStep } = useFunnel();
  const [contact, setContact] = useState<ContactForm>(state.contact || {
    name: '',
    email: '',
    phone: '',
    company: '',
    wantContact: false,
    method: undefined,
    time: undefined,
    privacy: false
  });
  const [errors, setErrors] = useState<Partial<Record<keyof ContactForm, string>>>({});

  const validateForm = () => {
    const newErrors: Partial<Record<keyof ContactForm, string>> = {};
    
    if (!contact.name) newErrors.name = 'Name ist erforderlich';
    if (!contact.email) newErrors.email = 'Email ist erforderlich';
    if (contact.email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contact.email)) {
      newErrors.email = 'Ungültige Email-Adresse';
    }
    if (contact.wantContact && !contact.method) {
      newErrors.method = 'Bitte wählen Sie eine Kontaktart';
    }
    if (contact.wantContact && !contact.time) {
      newErrors.time = 'Bitte wählen Sie eine Uhrzeit';
    }
    if (!contact.privacy) {
      newErrors.privacy = 'Bitte stimmen Sie der Datenverarbeitung zu';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleNext = () => {
    if (validateForm()) {
      console.log('Contact state before update:', contact);
      
      updateState({ contact });
      
      setTimeout(() => {
        console.log('Moving to next step');
        nextStep();
      }, 0);
    }
  };

  return (
    <FunnelStep
      title="Kontaktinformationen"
      subtitle="Bitte geben Sie Ihre Kontaktdaten an"
      onNext={handleNext}
      onBack={previousStep}
      isValid={contact.name && contact.email && contact.privacy && 
              (!contact.wantContact || (contact.method && contact.time))}
      currentStep={currentStep}
      totalSteps={6}
    >
      <motion.div 
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="glass-card max-w-2xl mx-auto"
      >
        <div className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField
              id="name"
              label="Name"
              value={contact.name}
              onChange={(value) => setContact(prev => ({ ...prev, name: value }))}
              error={errors.name}
              required
            />
            <InputField
              id="email"
              label="Email"
              type="email"
              value={contact.email}
              onChange={(value) => setContact(prev => ({ ...prev, email: value }))}
              error={errors.email}
              required
            />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField
              id="phone"
              label="Telefon"
              type="tel"
              value={contact.phone}
              onChange={(value) => setContact(prev => ({ ...prev, phone: value }))}
              error={errors.phone}
              required
            />
            <InputField
              id="company"
              label="Unternehmen"
              value={contact.company}
              onChange={(value) => setContact(prev => ({ ...prev, company: value }))}
              error={errors.company}
              required
            />
          </div>

          <div className="space-y-4">
            <label className="flex items-start space-x-3">
              <input
                type="checkbox"
                checked={contact.wantContact}
                onChange={(e) => setContact(prev => ({ 
                  ...prev, 
                  wantContact: e.target.checked,
                  method: e.target.checked ? prev.method : undefined,
                  time: e.target.checked ? prev.time : undefined
                }))}
                className="mt-1 rounded border-tuscher-blue/20 text-tuscher-cyan 
                         focus:ring-tuscher-cyan/30"
              />
              <span className="text-sm text-tuscher-blue/70">
                Ich möchte kontaktiert werden
              </span>
            </label>

            {contact.wantContact && (
              <div className="space-y-4 pl-4 sm:pl-8">
                <div>
                  <label className="block text-sm font-medium text-tuscher-blue mb-2">
                    Kontaktart
                  </label>
                  <div className="grid grid-cols-2 gap-2">
                    {[
                      { value: 'phone', label: 'Telefon', icon: '📞', description: 'Wir rufen Sie an' },
                      { value: 'email', label: 'E-Mail', icon: '✉️', description: 'Wir schreiben Ihnen' }
                    ].map((method) => (
                      <motion.button
                        key={method.value}
                        onClick={() => setContact(prev => ({ ...prev, method: method.value }))}
                        className={`
                          p-3 sm:p-6 rounded-lg border text-left transition-all
                          ${contact.method === method.value 
                            ? 'border-tuscher-blue bg-tuscher-blue/5' 
                            : 'border-gray-200 hover:border-gray-300'
                          }
                        `}
                        whileHover={{ scale: 1.01 }}
                        whileTap={{ scale: 0.99 }}
                      >
                        <div className="flex items-center space-x-2 sm:space-x-4">
                          <span className="hidden sm:inline text-2xl">{method.icon}</span>
                          <div>
                            <h3 className="font-medium text-sm sm:text-lg text-gray-900">
                              {method.label}
                            </h3>
                            <p className="text-gray-600 text-xs sm:text-sm mt-0.5 sm:mt-1 hidden sm:block">
                              {method.description}
                            </p>
                          </div>
                        </div>
                      </motion.button>
                    ))}
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-tuscher-blue mb-2">
                    Gewünschte Uhrzeit
                  </label>
                  <div className="grid grid-cols-2 gap-2">
                    {[
                      { value: '09:00', label: 'Morgens', icon: '🌅', description: '8:00 - 10:00' },
                      { value: '12:00', label: 'Mittags', icon: '☀️', description: '11:00 - 13:00' },
                      { value: '15:00', label: 'Nachmittags', icon: '🌤️', description: '14:00 - 16:00' },
                      { value: '18:00', label: 'Abends', icon: '🌆', description: '17:00 - 19:00' }
                    ].map((timeSlot) => (
                      <motion.button
                        key={timeSlot.value}
                        onClick={() => setContact(prev => ({ ...prev, time: timeSlot.value }))}
                        className={`
                          p-3 sm:p-6 rounded-lg border text-left transition-all
                          ${contact.time === timeSlot.value 
                            ? 'border-tuscher-blue bg-tuscher-blue/5' 
                            : 'border-gray-200 hover:border-gray-300'
                          }
                        `}
                        whileHover={{ scale: 1.01 }}
                        whileTap={{ scale: 0.99 }}
                      >
                        <div className="flex items-center space-x-2 sm:space-x-4">
                          <span className="hidden sm:inline text-2xl">{timeSlot.icon}</span>
                          <div>
                            <h3 className="font-medium text-sm sm:text-lg text-gray-900">
                              {timeSlot.label}
                            </h3>
                            <p className="text-gray-600 text-xs sm:text-sm mt-0.5 sm:mt-1 hidden sm:block">
                              {timeSlot.description}
                            </p>
                          </div>
                        </div>
                      </motion.button>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </div>

          <div className="space-y-4 mt-6">
            <label className="flex items-start space-x-3">
              <input
                type="checkbox"
                checked={contact.privacy}
                onChange={(e) => setContact(prev => ({ 
                  ...prev, 
                  privacy: e.target.checked 
                }))}
                className="mt-1 rounded border-tuscher-blue/20 text-tuscher-cyan 
                         focus:ring-tuscher-cyan/30"
              />
              <span className="text-sm text-tuscher-blue/70">
                Ich stimme der Verarbeitung meiner Daten zu*
              </span>
            </label>
            {errors.privacy && <p className="text-sm text-red-500">{errors.privacy}</p>}
          </div>
        </div>
      </motion.div>
    </FunnelStep>
  );
};

export default Step5Contact;
