declare module 'markdown-to-jsx' {
  import { ComponentType, ReactNode } from 'react';
  
  export interface MarkdownOptions {
    wrapper?: string | ComponentType<any>;
    forceWrapper?: boolean;
    forceBlock?: boolean;
    overrides?: {
      [key: string]: {
        component?: ComponentType<any>;
        props?: Record<string, any>;
        render?: (props: any) => ReactNode;
      };
    };
    createElement?: (...args: any[]) => ReactNode;
    slugify?: (str: string) => string;
    enforceAtxHeadings?: boolean;
    disableParsingRawHTML?: boolean;
  }

  const Markdown: ComponentType<{
    children: string;
    options?: MarkdownOptions;
    className?: string;
  }>;

  export default Markdown;
} 