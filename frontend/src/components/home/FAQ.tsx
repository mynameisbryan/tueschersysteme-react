'use client';

import React from 'react';
import { FAQData } from '@/types/content';
import { Disclosure, Transition } from '@headlessui/react';
import { ChevronDownIcon } from '@heroicons/react/24/outline';

type FAQSectionProps = {
  faqs?: FAQData[];
};

const FAQSection: React.FC<FAQSectionProps> = ({ faqs = [] }) => {
  return (
    <section className="relative w-full py-24 overflow-hidden bg-white">
      {/* Main Background Gradient */}
      <div className="absolute inset-0">
        <div className="absolute inset-0 bg-[radial-gradient(70%_50%_at_50%_50%,_var(--tw-gradient-stops))]
                      from-tuscher-cyan/20 via-tuscher-cyan/5 to-white" />
      </div>

      {/* Accent Gradients */}
      <div className="absolute inset-0">
        <div className="absolute top-0 left-1/4 w-1/2 h-1/2 
                      bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))]
                      from-tuscher-cyan/10 via-transparent to-transparent 
                      blur-3xl" />
      </div>

      <div className="container relative mx-auto px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="text-center mb-16">
          <h2 className="section-title">Häufig gestellte Fragen</h2>
        </div>

        {/* FAQ Grid */}
        <div className="max-w-3xl mx-auto space-y-4">
          {faqs?.map((faq) => (
            <Disclosure as="div" key={faq.id}>
              {({ open }) => (
                <div className="group">
                  <Disclosure.Button className="w-full text-left rounded-xl px-6 py-4
                                             bg-white/80 backdrop-blur-sm
                                             hover:bg-white/90 transition-all duration-300
                                             border border-tuscher-cyan/10
                                             shadow-[0_4px_20px_-4px_rgba(124,221,186,0.15)]">
                    <div className="flex justify-between items-center">
                      <span className="text-lg font-medium text-tuscher-blue">
                        {faq.Question}
                      </span>
                      <ChevronDownIcon
                        className={`${
                          open ? 'rotate-180 transform' : ''
                        } w-5 h-5 text-tuscher-cyan transition-transform duration-300`}
                      />
                    </div>
                  </Disclosure.Button>
                  <Transition
                    enter="transition duration-200 ease-out"
                    enterFrom="transform scale-95 opacity-0"
                    enterTo="transform scale-100 opacity-100"
                    leave="transition duration-100 ease-out"
                    leaveFrom="transform scale-100 opacity-100"
                    leaveTo="transform scale-95 opacity-0"
                  >
                    <Disclosure.Panel className="px-6 py-4 mt-2 
                                              bg-white/70 backdrop-blur-sm rounded-xl
                                              border border-tuscher-cyan/5">
                      <p className="text-tuscher-blue/70 leading-relaxed">
                        {faq.Answer}
                      </p>
                    </Disclosure.Panel>
                  </Transition>
                </div>
              )}
            </Disclosure>
          ))}
        </div>
      </div>
    </section>
  );
};

export default FAQSection;
