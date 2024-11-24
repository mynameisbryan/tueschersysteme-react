// frontend/src/components/ui/StepIndicator.tsx
export function StepIndicator({ 
    steps, 
    currentStep 
  }: { 
    steps: string[]; 
    currentStep: number 
  }) {
    return (
      <div className="flex items-center justify-center space-x-4">
        {steps.map((step, index) => (
          <div key={index} className={`
            flex items-center
            ${index <= currentStep ? 'text-tuscher-blue' : 'text-gray-400'}
          `}>
            <div className={`
              w-8 h-8 rounded-full flex items-center justify-center
              ${index === currentStep ? 'bg-tuscher-blue text-white' : 
                index < currentStep ? 'bg-tuscher-cyan/20' : 'bg-gray-200'}
            `}>
              {index + 1}
            </div>
            {index < steps.length - 1 && (
              <div className={`
                w-12 h-0.5 mx-2
                ${index < currentStep ? 'bg-tuscher-blue' : 'bg-gray-200'}
              `} />
            )}
          </div>
        ))}
      </div>
    );
  }