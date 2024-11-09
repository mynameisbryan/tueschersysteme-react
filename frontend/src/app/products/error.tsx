'use client';

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <div className="container mx-auto px-4 py-16">
      <div className="text-center">
        <h1 className="text-2xl font-bold text-red-600 mb-4">
          Fehler beim Laden der Produkte
        </h1>
        <p className="text-gray-600 mb-8">
          {error.message || 'Bitte versuchen Sie es später erneut.'}
        </p>
        <button
          onClick={reset}
          className="px-6 py-3 bg-tuscher-blue text-white rounded-lg 
                   hover:bg-tuscher-blue/90 transition-colors"
        >
          Erneut versuchen
        </button>
      </div>
    </div>
  );
} 