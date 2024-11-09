'use server'

import { z } from 'zod';
import { headers } from 'next/headers';

const contactFormSchema = z.object({
  data: z.object({
    name: z.string().min(2, "Name must be at least 2 characters"),
    email: z.string().email("Invalid email address"),
    phone: z.string().optional(),
    message: z.string().min(10, "Message must be at least 10 characters"),
    privacy: z.boolean().refine(val => val === true, {
      message: "You must accept the privacy policy"
    }),
    newsletter: z.boolean()
  })
});

export type ContactFormData = z.infer<typeof contactFormSchema>['data'];

const getStrapiUrl = () => {
  const isDevelopment = process.env.NODE_ENV === 'development';
  return isDevelopment 
    ? 'http://localhost:1337'
    : process.env.STRAPI_INTERNAL_URL || 'http://strapi:1337';
};

export async function submitContactForm(formData: ContactFormData) {
  try {
    if (!process.env.STRAPI_API_TOKEN) {
      throw new Error('Missing required API token');
    }

    const strapiUrl = getStrapiUrl();
    console.log('Submitting to Strapi URL:', strapiUrl);
    
    const strapiData = {
      data: formData
    };
    
    console.log('Sending data to Strapi:', JSON.stringify(strapiData, null, 2));
    
    const response = await fetch(`${strapiUrl}/api/contact-forms`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${process.env.STRAPI_API_TOKEN}`,
        'Accept': 'application/json'
      },
      body: JSON.stringify(strapiData),
      cache: 'no-store'
    });

    if (!response.ok) {
      let errorMessage = 'Failed to submit form';
      try {
        const errorData = await response.json();
        errorMessage = errorData.error?.message || errorData.message || errorMessage;
      } catch {
        errorMessage = `${response.status}: ${response.statusText}`;
      }
      throw new Error(errorMessage);
    }

    return { success: true };
  } catch (error) {
    console.error('Submit error details:', error);
    return { 
      success: false, 
      error: error instanceof z.ZodError 
        ? error.errors[0].message 
        : error instanceof Error 
          ? error.message 
          : 'Failed to submit form'
    };
  }
}