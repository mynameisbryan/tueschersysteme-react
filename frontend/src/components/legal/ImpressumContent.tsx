'use client';

interface Block {
  type: string;
  children: Array<{
    text: string;
    type?: string;
    url?: string;
  }>;
}

interface ImpressumContentProps {
  data: {
    company_info: Block[];
    representative: Block[];
    contact: Block[];
    tax_info: Block[];
    content_responsible: Block[];
    liability_disclaimer: Block[];
    copyright_notice: Block[];
    data_policy: Block[];
  }
}

export default function ImpressumContent({ data }: ImpressumContentProps) {
  const renderBlocks = (blocks: Block[]) => {
    if (!blocks) return null;
    
    return blocks.map((block, blockIndex) => {
      if (block.type === 'paragraph') {
        return (
          <p key={blockIndex} className="mb-3 leading-relaxed">
            {block.children.map((child, childIndex) => {
              if (child.type === 'link') {
                return (
                  <a 
                    key={childIndex}
                    href={child.url}
                    className="text-blue-600 hover:underline break-words"
                  >
                    {child.text}
                  </a>
                );
              }
              return <span key={childIndex} className="whitespace-pre-line">{child.text}</span>;
            })}
          </p>
        );
      }
      return null;
    });
  };

  return (
    <article className="max-w-3xl mx-auto py-24 px-4 sm:px-6 lg:px-8">
      <h1 className="text-3xl font-bold mb-8 pb-2 border-b">Impressum</h1>
      
      <section className="mb-10">
        <h2 className="text-2xl font-bold mb-4">Firmeninformationen</h2>
        <div className="text-lg">{renderBlocks(data.company_info)}</div>
      </section>

      <section className="mb-10">
        <h2 className="text-2xl font-bold mb-4">Vertreten durch</h2>
        <div className="text-lg">{renderBlocks(data.representative)}</div>
      </section>

      <section className="mb-10">
        <h2 className="text-2xl font-bold mb-4">Kontakt</h2>
        <div className="text-lg">{renderBlocks(data.contact)}</div>
      </section>

      <section className="mb-10">
        <h2 className="text-2xl font-bold mb-4">Umsatzsteuer-ID</h2>
        <div className="text-lg">{renderBlocks(data.tax_info)}</div>
      </section>

      <section className="mb-10">
        <h2 className="text-2xl font-bold mb-4">Inhaltlich Verantwortlicher</h2>
        <div className="text-lg">{renderBlocks(data.content_responsible)}</div>
      </section>

      <section className="mb-10">
        <h2 className="text-2xl font-bold mb-4">Haftungsausschluss</h2>
        <div className="text-lg space-y-4">{renderBlocks(data.liability_disclaimer)}</div>
      </section>

      <footer className="mt-12 pt-6 border-t text-sm text-gray-600">
        <div className="space-y-2">{renderBlocks(data.copyright_notice)}</div>
      </footer>
    </article>
  );
} 