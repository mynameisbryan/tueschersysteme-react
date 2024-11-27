'use client';

import Markdown from 'markdown-to-jsx';
import { convertBlocksToMarkdown } from '@/utils/markdown';
import { Block } from '@/types/content';
import ErrorBoundary from '../common/ErrorBoundary';

interface AGBContentProps {
  data: {
    id: number;
    agb: Block[];
    // ... other fields
  } | null;
}

const AGBContent: React.FC<AGBContentProps> = ({ data }) => {
  console.log('[AGB] Received data:', {
    hasData: !!data,
    hasAGB: !!data?.agb,
    agbLength: data?.agb?.length
  });

  if (!data || !Array.isArray(data.agb)) {
    console.error('[AGB] Invalid or missing AGB content:', data);
    return <div className="p-4 text-gray-600">Content not available</div>;
  }

  const markdownContent = convertBlocksToMarkdown(data.agb);
  if (!markdownContent.trim()) {
    return <div className="p-4 text-gray-600">No content to display</div>;
  }

  return (
    <ErrorBoundary>
      <article className="max-w-3xl mx-auto py-24 px-4 sm:px-6 lg:px-8">
        <div className="prose prose-tuscher max-w-none">
          <Markdown options={{
            wrapper: 'div',
            forceWrapper: true,
            forceBlock: true,
            overrides: {
              h1: { props: { className: 'text-3xl font-bold mb-6' } },
              h2: { props: { className: 'text-2xl font-bold mb-4 mt-8' } },
              h3: { props: { className: 'text-xl font-bold mb-3 mt-6' } },
              p: { props: { className: 'mb-4 leading-relaxed' } },
              a: { props: { className: 'text-blue-600 hover:underline' } },
              hr: { props: { className: 'my-8 border-t border-gray-200' } },
              ul: { props: { className: 'list-disc pl-6 mb-4' } },
              ol: { props: { className: 'list-decimal pl-6 mb-4' } },
            },
          }}>
            {markdownContent}
          </Markdown>
        </div>
      </article>
    </ErrorBoundary>
  );
};

export default AGBContent; 