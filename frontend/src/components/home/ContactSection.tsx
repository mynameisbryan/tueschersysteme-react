'use client';

import { useState, useTransition } from 'react';
import { ContactSectionData } from '@/types/content';
import { submitContactForm, type ContactFormData } from '@/app/actions/contact';
import Button from '@/components/ui/Button';
import { motion } from 'framer-motion';
import Link from 'next/link';

interface ContactSectionProps {
  initialData: ContactSectionData;
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
  id: keyof ContactFormData;
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
      {label}
    </label>
    {error && <p className="mt-1 text-sm text-red-500">{error}</p>}
  </div>
);

const ContactInfo = ({ icon: Icon, title, value }: { 
  icon: React.ComponentType<{ className?: string }>;
  title: string;
  value: string;
}) => (
  <div className="bg-white/90 backdrop-blur-md rounded-lg p-3 sm:p-4 
                  border border-white/20 shadow-lg transition-all duration-300
                  hover:bg-white/95 flex items-start space-x-3">
    <div className="rounded-full bg-tuscher-cyan/10 p-2 
                    group-hover:bg-tuscher-cyan/20 transition-colors">
      <Icon className="h-5 w-5 text-tuscher-cyan" />
    </div>
    <div className="min-w-0">
      <h3 className="font-bold text-tuscher-blue text-sm">{title}</h3>
      <p className="text-sm text-tuscher-blue/70 truncate">{value}</p>
    </div>
  </div>
);

export default function ContactSection({ initialData }: ContactSectionProps) {
  const [isPending, startTransition] = useTransition();
  const [formData, setFormData] = useState<ContactFormData>({
    name: '',
    email: '',
    phone: '',
    message: '',
    privacy: false,
    newsletter: false
  });
  const [status, setStatus] = useState<'idle' | 'pending' | 'success' | 'error'>('idle');
  const [errorMessage, setErrorMessage] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    console.log('Submitting form data:', formData);

    startTransition(async () => {
      try {
        const result = await submitContactForm(formData);
        console.log('Form submission result:', result);

        if (result.success) {
          setStatus('success');
          setFormData({ name: '', email: '', phone: '', message: '', privacy: false, newsletter: false });
        } else {
          setStatus('error');
          setErrorMessage(result.error || 'Failed to submit form');
        }
      } catch (error) {
        console.error('Form submission error:', error);
        setStatus('error');
        setErrorMessage('Failed to submit form');
      }
    });
  };

  return (
    <section id="contact-section" className="section bg-white">
      {/* Existing content */}
      <div className="container mx-auto px-4 sm:px-6 lg:px-8 pb-16">
        <div className="text-center max-w-2xl mx-auto">
          <h2 className="section-title">{initialData.title}</h2>
          <p className="mt-4 text-lg text-tuscher-blue/70">
            {initialData.subtitle}
          </p>
          <div className="pt-4">
              <Link 
                href="/salesfunnel"
                className="inline-flex items-center justify-center 
                         px-12 py-5 text-lg font-medium
                         bg-tuscher-blue text-white
                         rounded-xl shadow-lg
                         hover:shadow-xl hover:bg-tuscher-blue-light
                         transform hover:scale-[1.02] active:scale-[0.98]
                         transition-all duration-300"
              >
                {initialData.CTAText}
              </Link>
            </div>
        </div>
      </div>

      {/* Content Container */}
      <div className="container mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid lg:grid-cols-2 gap-6 md:gap-8">
          {/* Left Column: Contact Form */}
          <div className="glass-card">
            <form onSubmit={handleSubmit} className="space-y-6">
              <InputField
                id="name"
                label="Name"
                value={formData.name}
                onChange={(value) => setFormData(prev => ({ ...prev, name: value }))}
                required
              />
              <InputField
                id="email"
                label="Email"
                type="email"
                value={formData.email}
                onChange={(value) => setFormData(prev => ({ ...prev, email: value }))}
                required
              />
              <InputField
                id="phone"
                label="Telefon"
                type="tel"
                value={formData.phone || ''}
                onChange={(value) => setFormData(prev => ({ ...prev, phone: value }))}
              />
              <div className="relative mb-6">
                <textarea
                  id="message"
                  value={formData.message}
                  onChange={(e) => setFormData(prev => ({ ...prev, message: e.target.value }))}
                  className="peer block w-full rounded border-2 border-tuscher-blue/20 bg-white/80 
                           py-3 px-4 text-tuscher-blue placeholder-transparent min-h-[120px]
                           focus:border-tuscher-cyan focus:outline-none focus:ring-0"
                  placeholder="Ihre Nachricht"
                  required
                />
                <label
                  htmlFor="message"
                  className="absolute -top-2.5 left-3 bg-white px-1 text-sm text-tuscher-blue/70
                           transition-all peer-placeholder-shown:top-3 peer-placeholder-shown:left-4 
                           peer-placeholder-shown:text-base peer-focus:-top-2.5 peer-focus:left-3 
                           peer-focus:text-sm peer-focus:text-tuscher-cyan"
                >
                  Ihre Nachricht
                </label>
              </div>

              <div className="space-y-4">
                <label className="flex items-start space-x-3 text-sm">
                  <input
                    type="checkbox"
                    checked={formData.privacy}
                    onChange={(e) => setFormData(prev => ({ ...prev, privacy: e.target.checked }))}
                    className="mt-1 rounded border-tuscher-blue/20 text-tuscher-cyan 
                             focus:ring-tuscher-cyan/30"
                  />
                  <span className="text-tuscher-blue/70">{initialData.contact_form.privacy_text}</span>
                </label>

                <label className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    checked={formData.newsletter}
                    onChange={(e) => setFormData(prev => ({ ...prev, newsletter: e.target.checked }))}
                    className="rounded border-gray-300 text-sky-600 shadow-sm focus:border-sky-300 focus:ring focus:ring-sky-200 focus:ring-opacity-50"
                  />
                  <span className="text-sm text-gray-700">{initialData.contact_form.newsletter_text}</span>
                </label>
              </div>

              <Button
                type="submit"
                disabled={isPending}
                className="w-full"
              >
                {isPending ? 'Wird gesendet...' : initialData.contact_form.submit_button_text}
              </Button>

              {status === 'success' && (
                <p className="text-green-600 text-center">{initialData.contact_form.success_message}</p>
              )}
              {status === 'error' && (
                <p className="text-red-600 text-center">{errorMessage}</p>
              )}
            </form>
          </div>

          {/* Right Column: Contact Info + Map */}
          <div className="space-y-6">
            {/* Contact Info Grid */}
            <div className="grid grid-cols-2 sm:grid-cols-2 gap-4">
              <ContactInfo 
                icon={LocationIcon} 
                title="Adresse" 
                value={`${initialData.address.street}, ${initialData.address.postal_code} ${initialData.address.city}`} 
              />
              <ContactInfo 
                icon={PhoneIcon} 
                title="Telefon" 
                value={initialData.address.phone} 
              />
              <ContactInfo 
                icon={EmailIcon} 
                title="Email" 
                value={initialData.address.email} 
              />
              <ContactInfo 
                icon={ClockIcon} 
                title="Öffnungszeiten" 
                value={initialData.address.opening_hours} 
              />
            </div>

            {/* Map */}
            <div className="glass-card p-0 overflow-hidden h-[calc(100%-180px)] min-h-[300px]">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2547.676876632741!2d8.837899776891817!3d50.43544308991286!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47bc3c2d6c8f6ae7%3A0x9f12d42cd78d3c13!2sAm%20Bollwerk%2027%2C%2035510%20Butzbach!5e0!3m2!1sde!2sde!4v1709831456789!5m2!1sde!2sde"
                className="w-full h-full border-0"
                allowFullScreen
                loading="lazy"
                referrerPolicy="no-referrer-when-downgrade"
              />
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

// Add these icon components at the bottom of the file
const PhoneIcon = ({ className = "" }) => (
  <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} 
          d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
  </svg>
);

const EmailIcon = ({ className = "" }) => (
  <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
  </svg>
);

const LocationIcon = ({ className = "" }) => (
  <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
  </svg>
);

const ClockIcon = ({ className = "" }) => (
  <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
  </svg>
);