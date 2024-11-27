'use client';

import Markdown from 'markdown-to-jsx';
import { convertBlocksToMarkdown } from '@/utils/markdown';
import { Block } from '@/types/content';
import ErrorBoundary from '../common/ErrorBoundary';

interface ImpressumContentProps {
  data: {
    id: number;
    company_info: Block[];
    representative: Block[];
    contact: Block[];
    tax_info: Block[];
    content_responsible: Block[];
    liability_disclaimer: Block[];
    copyright_notice: Block[];
    // ... other fields
  } | null;
}

const ImpressumContent: React.FC<ImpressumContentProps> = ({ data }) => {
  console.log('[Impressum] Received data:', {
    hasData: !!data,
    sections: data ? Object.keys(data) : []
  });

  if (!data) {
    console.error('[Impressum] Missing data');
    return <div className="p-4 text-gray-600">Content not available</div>;
  }

  const sections = [
    { content: data.company_info, title: 'Company Information', id: 'company-info' },
    { content: data.representative, title: 'Representative', id: 'representative' },
    { content: data.contact, title: 'Contact', id: 'contact' },
    { content: data.tax_info, title: 'Tax Information', id: 'tax-info' },
    { content: data.content_responsible, title: 'Content Responsible', id: 'content-responsible' },
    { content: data.liability_disclaimer, title: 'Liability Disclaimer', id: 'liability' },
    { content: data.copyright_notice, title: 'Copyright Notice', id: 'copyright' }
  ].filter(section => Array.isArray(section.content) && section.content.length > 0);

  if (sections.length === 0) {
    return <div className="p-4 text-gray-600">No content to display</div>;
  }

  return (
    <ErrorBoundary>
      <article className="max-w-3xl mx-auto py-24 px-4 sm:px-6 lg:px-8">
        <div className="prose prose-tuscher max-w-none">
          {sections.map(({ content, title, id }) => {
            const markdownContent = convertBlocksToMarkdown(content);
            return markdownContent.trim() ? (
              <section key={id} id={id}>
                <h2 className="text-2xl font-bold mb-4 mt-8">{title}</h2>
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
              </section>
            ) : null;
          })}
        </div>
      </article>
    </ErrorBoundary>
  );
};

export default ImpressumContent; 