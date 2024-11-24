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

const additionalInfoSchema = z.object({
  location: z.string().optional(),
  householdSize: z.string().optional(),
  livingSituation: z.string().optional(),
  specificRequirements: z.string().optional(),
  customizationNeeds: z.array(z.string()).optional(),
  preferredFeatures: z.array(z.string()).optional(),
  painPoints: z.string().optional()
});

export const salesFunnelSchema = z.object({
  products: z.array(z.object({
    category: z.string(),
    name: z.string(),
    quantity: z.number()
  })),
  budget: z.string(),
  timeline: z.string(),
  additionalInfo: additionalInfoSchema,
  contact: z.object({
    name: z.string(),
    email: z.string().email(),
    phone: z.string().optional(),
    company: z.string().optional(),
    privacy: z.boolean(),
    wantContact: z.boolean().optional(),
    method: z.string().optional(),
    time: z.string().optional()
  })
});

export type ContactFormData = z.infer<typeof contactFormSchema>;
export type SalesFunnelFormData = z.infer<typeof salesFunnelSchema>;