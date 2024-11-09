'use client';

import { useRouter, usePathname } from 'next/navigation';
import Link from 'next/link';

interface NavigationButtonProps {
  href: string;
  className: string;
  children: React.ReactNode;
  offset?: number;
}

export default function NavigationButton({
  href,
  className,
  children,
  offset = 90
}: NavigationButtonProps) {
  const router = useRouter();
  const pathname = usePathname();
  
  const handleClick = (e: React.MouseEvent) => {
    e.preventDefault();
    
    if (pathname === '/') {
      // If we're on home page, scroll to the section
      const element = document.getElementById(href.replace('#', ''));
      if (element) {
        const elementPosition = element.getBoundingClientRect().top;
        const offsetPosition = elementPosition + window.pageYOffset - offset;
        window.scrollTo({
          top: offsetPosition,
          behavior: 'smooth'
        });
      }
    } else {
      // If we're on another page, navigate to home and then scroll
      router.push(`/${href}`);
    }
  };

  return (
    <Link href={href} className={className} onClick={handleClick}>
      {children}
    </Link>
  );
} 