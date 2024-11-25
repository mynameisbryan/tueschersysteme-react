import { Metadata } from 'next';
import DataPolicyContent from '@/components/legal/DataPolicyContent';
import { Suspense } from 'react';
import { getImpressumData } from '@/utils/api';

export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: 'Datenschutz | Tüscher Systeme',
  description: 'Datenschutzerklärung und Informationen zum Umgang mit Ihren Daten',
};

export default async function DataPolicyPage() {
  console.log('[DataPolicyPage] Starting to render');
  
  try {
    const response = await getImpressumData();
    console.log('[DataPolicyPage] API Response:', JSON.stringify(response, null, 2));

    if (!response?.data) {
      console.error('[DataPolicyPage] No data in response');
      throw new Error('No data in response');
    }

    return (
      <main className="container mx-auto px-4 py-8">
        <Suspense fallback={
          <div className="text-center">
            <p>Loading Datenschutzerklärung...</p>
          </div>
        }>
          <DataPolicyContent data={response.data} />
        </Suspense>
      </main>
    );
  } catch (error) {
    console.error('[DataPolicyPage] Error:', error);
    return (
      <main className="container mx-auto px-4 py-8">
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Error</h1>
          <p>Failed to load Datenschutzerklärung. {error instanceof Error ? error.message : ''}</p>
        </div>
      </main>
    );
  }
} 