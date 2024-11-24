import React, { useState } from 'react';
import { useFunnel } from '../FunnelContext';
import FunnelStep from '@/components/salesfunnel/FunnelStep';
import { submitSalesFunnelInquiry } from '@/app/actions/sales-funnel';
import { motion, AnimatePresence } from 'framer-motion';
import { salesFunnelSchema } from '@/schemas/salesfunnel';
import { z } from 'zod';

const SummarySection = ({ title, children }: { title: string; children: React.ReactNode }) => (
  <div className="bg-white/90 backdrop-blur-md rounded-lg p-6 
                  border border-tuscher-blue/10 shadow-lg hover:shadow-xl
                  transition-all duration-300 hover:border-tuscher-blue/20">
    <h3 className="font-bold text-tuscher-blue mb-4">{title}</h3>
    {children}
  </div>
);

const Step6Summary = () => {
  const { state, currentStep, previousStep } = useFunnel();
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [status, setStatus] = useState<'idle' | 'success' | 'error'>('idle');
  const [errorMessage, setErrorMessage] = useState('');
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    setStatus('idle');
    setErrorMessage('');

    try {
      const validatedData = salesFunnelSchema.parse(state);
      console.log('Submitting data:', validatedData);

      const response = await submitSalesFunnelInquiry(validatedData);
      console.log('API Response:', response);

      if (response.success && response.data) {
        setStatus('success');
      } else {
        setStatus('error');
        setErrorMessage(response.error || 'Fehler beim Speichern der Daten');
      }

      setIsSubmitted(true);
      
      const successElement = document.getElementById('submit-success');
      if (successElement) {
        successElement.scrollIntoView({
          behavior: 'smooth',
          block: 'center'
        });
      }
    } catch (error) {
      console.error('Submission error:', error);
      setStatus('error');
      setErrorMessage(
        error instanceof z.ZodError 
          ? 'Validierungsfehler: ' + error.errors[0].message 
          : error instanceof Error 
            ? error.message 
            : 'Ein unerwarteter Fehler ist aufgetreten'
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  const timelineLabels: Record<string, string> = {
    'one_month': 'In den nächsten 4-6 Wochen',
    'three_months': 'In den nächsten 3 Monaten',
    'six_months': 'In den nächsten 6 Monaten',
    'flexible': 'Flexibel'
  };

  const groupProductsByCategory = () => {
    const grouped: Record<string, Array<{ name: string; quantity: number }>> = {};
    state.products.forEach(product => {
      if (!grouped[product.category]) {
        grouped[product.category] = [];
      }
      grouped[product.category].push({
        name: product.name,
        quantity: product.quantity
      });
    });
    return grouped;
  };

  return (
    <FunnelStep
      title="Zusammenfassung Ihrer Anfrage"
      subtitle="Überprüfen Sie Ihre Angaben und senden Sie die Anfrage ab"
      onNext={handleSubmit}
      onBack={previousStep}
      isValid={true}
      isLoading={isSubmitting}
      currentStep={currentStep}
      totalSteps={6}
    >
      <div className="max-w-3xl mx-auto">
        <AnimatePresence mode="wait">
          {status === 'success' ? (
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="bg-green-50 border border-green-200 rounded-lg p-8 text-center"
            >
              <span className="text-4xl mb-4 block">✨</span>
              <h3 className="text-xl font-semibold text-green-800 mb-2">
                Vielen Dank für Ihre Anfrage!
              </h3>
              <p className="text-green-600">
                Wir werden uns schnellstmöglich mit Ihnen in Verbindung setzen.
              </p>
            </motion.div>
          ) : (
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="space-y-6"
            >
              {status === 'error' && (
                <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
                  <p className="text-red-600 text-center">{errorMessage}</p>
                </div>
              )}

              <div className="grid gap-6">
                <SummarySection title="Ausgewählte Produkte">
                  <ul className="space-y-3">
                    {Object.entries(groupProductsByCategory()).map(([category, products]) => (
                      <li key={category} className="pb-3 border-b border-gray-100 last:border-0">
                        <strong className="text-gray-700">{category}:</strong>
                        <div className="mt-1 flex flex-wrap gap-2">
                          {products.map((product, idx) => (
                            <span
                              key={idx}
                              className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600"
                            >
                              {product.name} ({product.quantity}x)
                            </span>
                          ))}
                        </div>
                      </li>
                    ))}
                  </ul>
                </SummarySection>

                <SummarySection title="Budget">
                  <p className="text-tuscher-blue/70">
                    {parseInt(state.budget).toLocaleString('de-DE')} €
                  </p>
                </SummarySection>

                <SummarySection title="Zeitrahmen">
                  <p className="text-tuscher-blue/70">
                    {timelineLabels[state.timeline] || state.timeline}
                  </p>
                </SummarySection>

                <SummarySection title="Kontaktinformationen">
                  <div className="space-y-2">
                    <p className="text-tuscher-blue/70">
                      <strong>Name:</strong> {state.contact.name}
                    </p>
                    <p className="text-tuscher-blue/70">
                      <strong>Email:</strong> {state.contact.email}
                    </p>
                    {state.contact.phone && (
                      <p className="text-tuscher-blue/70">
                        <strong>Telefon:</strong> {state.contact.phone}
                      </p>
                    )}
                    {state.contact.company && (
                      <p className="text-tuscher-blue/70">
                        <strong>Unternehmen:</strong> {state.contact.company}
                      </p>
                    )}
                  </div>
                </SummarySection>

                <SummarySection title="Zusätzliche Informationen">
                  <div className="space-y-2">
                    {state.additionalInfo?.location && (
                      <p className="text-tuscher-blue/70">
                        <strong>Standort:</strong> {state.additionalInfo.location}
                      </p>
                    )}
                    {state.additionalInfo?.livingSituation && (
                      <p className="text-tuscher-blue/70">
                        <strong>Wohnsituation:</strong> {state.additionalInfo.livingSituation}
                      </p>
                    )}
                    {state.additionalInfo?.householdSize && (
                      <p className="text-tuscher-blue/70">
                        <strong>Haushaltsgröße:</strong> {state.additionalInfo.householdSize}
                      </p>
                    )}
                    {state.additionalInfo?.age && (
                      <p className="text-tuscher-blue/70">
                        <strong>Alter:</strong> {state.additionalInfo.age}
                      </p>
                    )}
                    {state.additionalInfo?.gender && (
                      <p className="text-tuscher-blue/70">
                        <strong>Geschlecht:</strong> {state.additionalInfo.gender}
                      </p>
                    )}
                    {state.additionalInfo?.specificRequirements && (
                      <p className="text-tuscher-blue/70">
                        <strong>Spezielle Anforderungen:</strong> {state.additionalInfo.specificRequirements}
                      </p>
                    )}
                    {state.additionalInfo?.customizationNeeds?.length > 0 && (
                      <div className="text-tuscher-blue/70">
                        <strong>Anpassungswünsche:</strong>
                        <div className="flex flex-wrap gap-2 mt-1">
                          {state.additionalInfo.customizationNeeds.map((need, idx) => (
                            <span key={idx} className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600">
                              {need}
                            </span>
                          ))}
                        </div>
                      </div>
                    )}
                    {state.additionalInfo?.preferredFeatures?.length > 0 && (
                      <div className="text-tuscher-blue/70">
                        <strong>Gewünschte Eigenschaften:</strong>
                        <div className="flex flex-wrap gap-2 mt-1">
                          {state.additionalInfo.preferredFeatures.map((feature, idx) => (
                            <span key={idx} className="inline-flex items-center px-3 py-1 rounded-full bg-white text-sm text-gray-600">
                              {feature}
                            </span>
                          ))}
                        </div>
                      </div>
                    )}
                    {state.additionalInfo?.painPoints && (
                      <p className="text-tuscher-blue/70">
                        <strong>Herausforderungen:</strong> {state.additionalInfo.painPoints}
                      </p>
                    )}
                  </div>
                </SummarySection>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </FunnelStep>
  );
};

export default Step6Summary;
