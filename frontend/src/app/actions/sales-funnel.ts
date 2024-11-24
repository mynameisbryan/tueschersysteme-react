'use server'

import { SalesFunnelFormData } from '@/types/sales-funnel';

export async function submitSalesFunnelInquiry(formData: SalesFunnelFormData) {
  try {
    const apiUrl = process.env.NEXT_PUBLIC_STRAPI_API_URL || 'http://localhost:1337';
    const apiToken = process.env.STRAPI_API_TOKEN;

    if (!apiToken) {
      throw new Error('API token is not configured');
    }

    const headers = {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${apiToken}`,
    };

    // First create contact form with required message field
    const contactResponse = await fetch(`${apiUrl}/api/contact-forms`, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        data: {
          name: formData.contact.name,
          email: formData.contact.email,
          phone: formData.contact.phone || null,
          company: formData.contact.company || null,
          message: `Sales Funnel Inquiry - Budget: ${formData.budget}`, // Added required message field
          wantContact: formData.contact.wantContact || false,
          method: formData.contact.method || null,
          time: formData.contact.time || null,
          privacy: formData.contact.privacy,
          newsletter: formData.contact.newsletter || false
        }
      })
    });

    if (!contactResponse.ok) {
      const error = await contactResponse.json();
      console.error('Contact form creation failed:', error);
      throw new Error('Failed to create contact form');
    }

    const contactData = await contactResponse.json();
    console.log('Contact form created:', contactData);

    // Then create sales inquiry with correct contact relation structure
    const salesResponse = await fetch(`${apiUrl}/api/sales-inquiries`, {
      method: 'POST',
      headers,
      body: JSON.stringify({
        data: {
          products: formData.products,
          budget: formData.budget,
          timeline: formData.timeline,
          contact: {
            connect: [{ id: contactData.data.id }] // Updated relation structure
          }
        }
      })
    });

    if (!salesResponse.ok) {
      const error = await salesResponse.json();
      console.error('Sales inquiry creation failed:', error);
      throw new Error('Failed to create sales inquiry');
    }

    const salesData = await salesResponse.json();
    console.log('Sales inquiry created:', salesData);

    return {
      success: true, 
      data: {
        contact: contactData.data,
        salesInquiry: salesData.data
      }
    };

  } catch (error) {
    console.error('Submission error:', error);
    return { 
      success: false, 
      error: error instanceof Error ? error.message : 'Ein unerwarteter Fehler ist aufgetreten'
    };
  }
} 
