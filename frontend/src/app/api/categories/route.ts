import { getProductCategories } from '@/utils/api';

export async function GET() {
  try {
    const response = await getProductCategories({
      populate: {
        Image: {
          fields: ['url', 'alternativeText', 'width', 'height', 'formats']
        },
        products: {
          populate: {
            MainImage: { fields: ['url', 'alternativeText', 'width', 'height', 'formats'] }
          }
        }
      }
    });

    return Response.json(response);
  } catch (error) {
    console.error('Categories API Error:', error);
    return Response.json({ error: 'Failed to fetch categories' }, { status: 500 });
  }
} 