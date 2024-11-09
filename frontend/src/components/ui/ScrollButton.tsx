'use client';

import Link from 'next/link';

interface ScrollButtonProps {
  href: string;
  className: string;
  children: React.ReactNode;
  offset?: number; // Optional offset for fixed headers
}

export default function ScrollButton({
  href,
  className,
  children,
  offset = 90 // Update to match your header height plus a small buffer
}: ScrollButtonProps) {
  const handleClick = (e: React.MouseEvent) => {
    e.preventDefault();
    const element = document.getElementById(href.replace('#', ''));
    if (element) {
      const elementPosition = element.getBoundingClientRect().top;
      const offsetPosition = elementPosition + window.pageYOffset - offset;

      window.scrollTo({
        top: offsetPosition,
        behavior: 'smooth'
      });
    }
  };

  return (
    <Link href={href} className={className} onClick={handleClick}>
      {children}
    </Link>
  );
} 