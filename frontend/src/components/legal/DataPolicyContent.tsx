'use client';

import Markdown from 'markdown-to-jsx';

interface Block {
  type: string;
  children: Array<{
    text: string;
    type?: string;
    url?: string;
    bold?: boolean;
    code?: boolean;
  }>;
}

interface DataPolicyContentProps {
  data: {
    attributes?: {
      data_policy?: any[];
    };
  };
}

export default function DataPolicyContent({ data }: DataPolicyContentProps) {
  if (!data?.attributes?.data_policy) {
    return <div>Loading Data Policy content...</div>;
  }

  // Convert blocks to markdown string
  const convertBlocksToMarkdown = (blocks: Block[]) => {
    if (!blocks) return '';
    
    return blocks.map(block => {
      const text = block.children.map(child => {
        if (child.type === 'link') {
          return `[${child.text}](${child.url})`;
        }
        if (child.bold) {
          return `**${child.text}**`;
        }
        return child.text;
      }).join('');

      switch (block.type) {
        case 'heading-1':
          return `# ${text}\n\n`;
        case 'heading-2':
          return `## ${text}\n\n`;
        case 'heading-3':
          return `### ${text}\n\n`;
        case 'paragraph':
          return `${text}\n\n`;
        case 'thematic-break':
          return '---\n\n';
        default:
          return text + '\n\n';
      }
    }).join('');
  };

  const markdownContent = convertBlocksToMarkdown(data.attributes.data_policy);

  return (
    <article className="max-w-3xl mx-auto py-24 px-4 sm:px-6 lg:px-8">
      <div className="prose prose-tuscher max-w-none">
        <Markdown
          options={{
            wrapper: 'div',
            forceWrapper: true,
            forceBlock: true,
            overrides: {
              h1: { props: { className: 'text-3xl font-bold mb-6' } },
              h2: { props: { className: 'text-2xl font-bold mb-4 mt-8' } },
              h3: { props: { className: 'text-xl font-bold mb-3 mt-6' } },
              p: { props: { className: 'mb-4 leading-relaxed' } },
              a: { props: { className: 'text-blue-600 hover:underline' } },
            },
          }}
        >
          {markdownContent}
        </Markdown>
      </div>
    </article>
  );
} 