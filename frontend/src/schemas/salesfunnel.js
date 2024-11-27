"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.salesFunnelSchema = exports.contactFormSchema = void 0;
// frontend/src/schemas/salesfunnel.ts
var zod_1 = require("zod");
exports.contactFormSchema = zod_1.z.object({
    name: zod_1.z.string().min(2, "Name muss mindestens 2 Zeichen lang sein"),
    email: zod_1.z.string().email("Ungültige E-Mail-Adresse"),
    phone: zod_1.z.string().optional(),
    company: zod_1.z.string().optional(),
    wantContact: zod_1.z.boolean().optional(),
    method: zod_1.z.enum(['phone', 'email']).optional(),
    time: zod_1.z.string().optional(),
    privacy: zod_1.z.boolean(),
    newsletter: zod_1.z.boolean().optional()
});
var additionalInfoSchema = zod_1.z.object({
    location: zod_1.z.string().optional(),
    householdSize: zod_1.z.string().optional(),
    livingSituation: zod_1.z.string().optional(),
    specificRequirements: zod_1.z.string().optional(),
    customizationNeeds: zod_1.z.array(zod_1.z.string()).optional(),
    preferredFeatures: zod_1.z.array(zod_1.z.string()).optional(),
    painPoints: zod_1.z.string().optional()
});
exports.salesFunnelSchema = zod_1.z.object({
    products: zod_1.z.array(zod_1.z.object({
        category: zod_1.z.string(),
        name: zod_1.z.string(),
        quantity: zod_1.z.number()
    })),
    budget: zod_1.z.string(),
    timeline: zod_1.z.string(),
    additionalInfo: additionalInfoSchema,
    contact: zod_1.z.object({
        name: zod_1.z.string(),
        email: zod_1.z.string().email(),
        phone: zod_1.z.string().optional(),
        company: zod_1.z.string().optional(),
        privacy: zod_1.z.boolean(),
        wantContact: zod_1.z.boolean().optional(),
        method: zod_1.z.string().optional(),
        time: zod_1.z.string().optional()
    })
});
