import { Metadata } from 'next';
import ImpressumContent from '@/components/legal/ImpressumContent';
import { Suspense } from 'react';
import { getImpressumData } from '@/utils/api';

export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: 'Impressum | Tüscher Systeme',
  description: 'Rechtliche Informationen und Impressum von Tüscher Systeme',
};

export default async function ImpressumPage() {
  console.log('[ImpressumPage] Starting to render');
  
  try {
    const response = await getImpressumData();
    console.log('[ImpressumPage] API Response:', JSON.stringify(response, null, 2));

    if (!response?.data) {
      console.error('[ImpressumPage] No data in response');
      throw new Error('No data in response');
    }

    return (
      <main className="container mx-auto px-4 py-8">
        <Suspense fallback={
          <div className="text-center">
            <p>Loading Impressum...</p>
          </div>
        }>
          <ImpressumContent data={response.data} />
        </Suspense>
      </main>
    );
  } catch (error) {
    console.error('[ImpressumPage] Error:', error);
    return (
      <main className="container mx-auto px-4 py-8">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Error</h1>
          <p>Failed to load Impressum content. {error instanceof Error ? error.message : ''}</p>
        </div>
      </main>
    );
  }
}