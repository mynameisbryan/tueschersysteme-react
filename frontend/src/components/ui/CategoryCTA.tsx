'use client';

import Link from 'next/link';

interface CategoryCTAProps {
  href: string;
  className?: string;
  children: React.ReactNode;
}

export default function CategoryCTA({ href, className = '', children }: CategoryCTAProps) {
  return (
    <Link href={href} className={className}>
      <div className="group relative inline-flex items-center justify-center 
                    px-6 py-3 rounded-lg overflow-hidden
                    bg-tuscher-blue text-white
                    shadow-lg
                    hover:shadow-xl
                    hover:bg-tuscher-blue-light
                    transition-all duration-300">
        <span className="relative z-10 flex items-center gap-2 font-medium">
          {children}
          <svg
            className="h-4 w-4 transform transition-transform duration-300 
                     group-hover:translate-x-1"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M9 5l7 7-7 7"
            />
          </svg>
        </span>
      </div>
    </Link>
  );
} 