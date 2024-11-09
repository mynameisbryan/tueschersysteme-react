'use client';

import React from 'react';
import { FAQData } from '@/types/content';
import { getFAQs } from '@/utils/api';
import { Disclosure, Transition } from '@headlessui/react';
import { ChevronDownIcon } from '@heroicons/react/24/outline';

type FAQSectionProps = {
  faqs?: FAQData[];
};

const FAQSection: React.FC<FAQSectionProps> = ({ faqs = [] }) => {
  return (
    <section className="w-full bg-gray-50 py-24">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="text-center mb-16">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">FAQ</h2>
          <p className="text-xl text-gray-600">Häufig gestellte Fragen</p>
        </div>

        {/* FAQ Grid */}
        <div className="max-w-3xl mx-auto space-y-4">
          {faqs?.map((faq) => (
            <Disclosure as="div" key={faq.id} className="bg-white rounded-lg shadow-sm">
              {({ open }) => (
                <>
                  <Disclosure.Button className="flex w-full justify-between items-center px-6 py-4 text-left">
                    <span className="text-lg font-medium text-gray-900">
                      {faq.Question}
                    </span>
                    <ChevronDownIcon
                      className={`${
                        open ? 'rotate-180 transform' : ''
                      } h-5 w-5 text-gray-500 transition-transform duration-200`}
                    />
                  </Disclosure.Button>
                  <Transition
                    enter="transition duration-100 ease-out"
                    enterFrom="transform scale-95 opacity-0"
                    enterTo="transform scale-100 opacity-100"
                    leave="transition duration-75 ease-out"
                    leaveFrom="transform scale-100 opacity-100"
                    leaveTo="transform scale-95 opacity-0"
                  >
                    <Disclosure.Panel className="px-6 pb-4 pt-2">
                      <p className="text-gray-600 leading-relaxed">
                        {faq.Answer}
                      </p>
                    </Disclosure.Panel>
                  </Transition>
                </>
              )}
            </Disclosure>
          ))}
        </div>

        {/* Contact CTA */}
        <div className="text-center mt-16">
          <p className="text-gray-600 mb-4">
            Haben Sie weitere Fragen? Wir sind für Sie da!
          </p>
          <a
            href="/kontakt"
            className="inline-flex items-center justify-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 transition-colors duration-200"
          >
            Kontaktieren Sie uns
          </a>
        </div>
      </div>
    </section>
  );
};

export default FAQSection;
