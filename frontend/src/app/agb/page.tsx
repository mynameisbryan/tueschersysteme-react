import { Metadata } from 'next';
import AGBContent from '@/components/legal/AGBContent';
import { Suspense } from 'react';
import { getImpressumData } from '@/utils/api';

export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: 'AGB | Tüscher Systeme',
  description: 'Allgemeine Geschäftsbedingungen von Tüscher Systeme',
};

export default async function AGBPage() {
  console.log('[AGBPage] Starting to render');
  
  try {
    const response = await getImpressumData();
    console.log('[AGBPage] API Response:', JSON.stringify(response, null, 2));

    if (!response?.data) {
      console.error('[AGBPage] No data in response');
      throw new Error('No data in response');
    }

    return (
      <main className="container mx-auto px-4 py-8">
        <Suspense fallback={
          <div className="text-center">
            <p>Loading AGB...</p>
          </div>
        }>
          <AGBContent data={response.data} />
        </Suspense>
      </main>
    );
  } catch (error) {
    console.error('[AGBPage] Error:', error);
    return (
      <main className="container mx-auto px-4 py-8">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Error</h1>
          <p>Failed to load AGB. {error instanceof Error ? error.message : ''}</p>
        </div>
      </main>
    );
  }
} 