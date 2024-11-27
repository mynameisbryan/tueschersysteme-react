import { Block } from '@/types/content';

export function convertBlocksToMarkdown(blocks: Block[]): string {
  if (!Array.isArray(blocks)) {
    console.warn('[Markdown Conversion] Invalid or missing blocks:', blocks);
    return '';
  }

  return blocks
    .map(block => {
      if (block.type === 'paragraph' && Array.isArray(block.children)) {
        return block.children
          .map(child => {
            if (child.type === 'text' && child.text?.trim()) {
              return child.text;
            }
            if (child.type === 'link' && child.url && Array.isArray(child.children)) {
              const linkText = child.children
                .map(linkChild => linkChild.text || '')
                .join('')
                .trim();
              return linkText ? `[${linkText}](${child.url})` : '';
            }
            return '';
          })
          .join('')
          .trim();
      }
      return '';
    })
    .filter(line => line.trim())
    .join('\n\n');
} 