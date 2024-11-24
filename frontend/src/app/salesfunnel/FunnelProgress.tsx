// components/salesfunnel/FunnelProgress.tsx
interface FunnelProgressProps {
    steps: string[];
    currentStep: number;
  }
  
  export default function FunnelProgress({ steps, currentStep }: FunnelProgressProps) {
    const progressSteps = [
      'Produkte',
      'Mengen',
      'Zeitrahmen',
      'Zusätzliche Infos',
      'Kontakt',
      'Zusammenfassung'
    ];

    return (
      <div className="container mx-auto px-4 mb-6">
        <div className="max-w-3xl mx-auto">
          {/* Mobile Progress (Shows only current step/total) */}
          <div className="md:hidden text-center text-sm text-tuscher-blue/70 mb-2">
            Schritt {currentStep + 1} von {progressSteps.length}
          </div>

          {/* Desktop Progress Bar */}
          <div className="hidden md:flex justify-between items-center">
            {progressSteps.map((step, index) => (
              <div key={index} className="flex items-center flex-1">
                {/* Step Circle */}
                <div className="flex flex-col items-center relative group">
                  <div className={`
                    w-6 h-6 rounded-full flex items-center justify-center text-xs font-medium
                    transition-all duration-300
                    ${index === currentStep 
                      ? 'bg-tuscher-blue text-white scale-110' 
                      : index < currentStep 
                        ? 'bg-tuscher-cyan/20 text-tuscher-blue'
                        : 'bg-gray-100 text-gray-400'}
                  `}>
                    {index + 1}
                  </div>
                  
                  {/* Step Label */}
                  <div className={`
                    absolute -bottom-6 whitespace-nowrap text-xs
                    transition-all duration-300
                    ${index === currentStep 
                      ? 'text-tuscher-blue font-medium' 
                      : index < currentStep 
                        ? 'text-tuscher-blue/70'
                        : 'text-gray-400'}
                  `}>
                    {step}
                  </div>
                </div>

                {/* Connector Line */}
                {index < progressSteps.length - 1 && (
                  <div className="flex-1 mx-2">
                    <div className={`
                      h-0.5 w-full
                      transition-all duration-300
                      ${index < currentStep 
                        ? 'bg-tuscher-blue' 
                        : 'bg-gray-200'}
                    `} />
                  </div>
                )}
              </div>
            ))}
          </div>

          {/* Progress Bar */}
          <div className="h-1 bg-gray-100 rounded-full mt-8 md:mt-10">
            <div 
              className="h-full bg-tuscher-blue rounded-full transition-all duration-500"
              style={{ 
                width: `${(currentStep / (progressSteps.length - 1)) * 100}%` 
              }}
            />
          </div>
        </div>
      </div>
    );
  }