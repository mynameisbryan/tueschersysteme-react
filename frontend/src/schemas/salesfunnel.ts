// frontend/src/schemas/salesfunnel.ts
import { z } from 'zod';

export const contactFormSchema = z.object({
  name: z.string().min(2, "Name muss mindestens 2 Zeichen lang sein"),
  email: z.string().email("Ungültige E-Mail-Adresse"),
  phone: z.string().optional(),
  company: z.string().optional(),
  wantContact: z.boolean().optional(),
  method: z.enum(['phone', 'email']).optional(),
  time: z.string().optional(),
  privacy: z.boolean(),
  newsletter: z.boolean().optional()
});

export const salesFunnelSchema = z.object({
  products: z.array(z.object({
    category: z.string(),
    name: z.string(),
    quantity: z.number()
  })).min(1, "Mindestens ein Produkt muss ausgewählt sein"),
  budget: z.string(),
  timeline: z.enum(['one_month', 'three_months', 'six_months', 'flexible']),
  contact: contactFormSchema
});

export type ContactFormData = z.infer<typeof contactFormSchema>;
export type SalesFunnelFormData = z.infer<typeof salesFunnelSchema>;