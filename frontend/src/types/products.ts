import { Product, BaseProductCategory } from './common';

export type { Product };
export type ProductCategory = BaseProductCategory;

export function isValidProductCategory(category: unknown): category is ProductCategory {
  if (!category || typeof category !== 'object') return false;
  
  const requiredFields = ['id', 'attributes'];
  const requiredAttributeFields = ['Title', 'Description', 'slug', 'Image', 'products'];
  
  return requiredFields.every(field => field in category) &&
         requiredAttributeFields.every(field => 
           field in (category as any).attributes && 
           (category as any).attributes[field] !== null
         );
}