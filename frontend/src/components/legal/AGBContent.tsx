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

interface AGBContentProps {
  data: {
    attributes?: {
      agb?: any[];
    };
  };
}

const AGBContent: React.FC<AGBContentProps> = ({ data }) => {
  if (!data?.attributes?.agb) {
    return <div>Loading AGB content...</div>;
  }

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

  const markdownContent = convertBlocksToMarkdown(data.attributes.agb);

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
              hr: { props: { className: 'my-8 border-t border-gray-200' } },
            },
          }}
        >
          {markdownContent}
        </Markdown>
      </div>
    </article>
  );
};

export default AGBContent; 