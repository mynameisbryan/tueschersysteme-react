declare module 'markdown-to-jsx' {
  import { ComponentType } from 'react';
  
  interface MarkdownOptions {
    wrapper?: string | ComponentType;
    forceWrapper?: boolean;
    forceBlock?: boolean;
  }

  const Markdown: ComponentType<{
    children: string;
    options?: MarkdownOptions;
    className?: string;
  }>;

  export default Markdown;
} 