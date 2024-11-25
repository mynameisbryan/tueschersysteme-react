'use client'

import Link from 'next/link'
import Image from 'next/image'
import { useState, useEffect } from 'react'
import { Bars3Icon, XMarkIcon } from '@heroicons/react/24/outline'
import MobileMenu from './MobileMenu'
import NavigationButton from '@/components/ui/NavigationButton'
import { usePathname } from 'next/navigation'

export default function Header() {
  const [isScrolled, setIsScrolled] = useState(false)
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false)
  const [scrollPosition, setScrollPosition] = useState(0)

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 0)
      const maxScroll = document.documentElement.scrollHeight - window.innerHeight
      const currentScroll = window.scrollY
      const scrollPercentage = (currentScroll / maxScroll) * 100
      setScrollPosition(scrollPercentage * 2)
    }
    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  return (
    <>
      <header className={`fixed w-full z-50 transition-all duration-300 ${
        isScrolled ? 'bg-white shadow-lg' : 'bg-white'
      }`}>
        <div className="container-padding flex items-center justify-between h-header">
          <Link href="/" className="flex items-center">
            <div style={{ position: 'relative', width: '160px', height: '55px' }}>
              <Image
                src="/images/logo.jpg"
                alt="Tüscher Systeme Logo"
                fill
                sizes="160px"
                priority
                style={{
                  objectFit: 'contain'
                }}
                onError={(e) => {
                  console.error('Error loading logo image')
                  e.currentTarget.src = '/logo.png'
                }}
              />
            </div>
          </Link>

          <nav className="hidden md:flex items-center space-x-8">
            <NavLink href="/">Home</NavLink>
            <NavLink href="/products">Produkte</NavLink>
            <NavigationButton 
              href="#contact-section" 
              className="btn-primary"
            >
              <span className="relative">Kontakt</span>
            </NavigationButton>
          </nav>

          <button 
            className="md:hidden text-tuscher-blue-navy p-2 hover:bg-gray-100 rounded-md transition-colors"
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
            aria-label="Toggle menu"
          >
            {isMobileMenuOpen ? (
              <XMarkIcon className="h-6 w-6" />
            ) : (
              <Bars3Icon className="h-6 w-6" />
            )}
          </button>
        </div>
        
        <div className="relative h-[3px] w-full overflow-hidden">
          <div 
            className="absolute inset-0"
            style={{
              background: `linear-gradient(90deg, 
                var(--color-blue-navy) 0%, 
                var(--color-cyan-DEFAULT) 25%, 
                var(--color-cyan-light) 50%, 
                var(--color-cyan-DEFAULT) 75%, 
                var(--color-blue-navy) 100%)`,
              backgroundSize: '400% 100%',
              backgroundPosition: `${-scrollPosition}% 0`,
              opacity: isScrolled ? '0.8' : '1',
              transition: 'opacity 0.3s ease-out',
              width: '100%',
              willChange: 'background-position'
            }}
          />
          <div 
            className="absolute inset-0"
            style={{
              boxShadow: isScrolled 
                ? '0 -1px 8px var(--color-cyan-glow)'
                : '0 -2px 12px var(--color-cyan-glow)'
            }}
          />
        </div>
      </header>

      <MobileMenu 
        isOpen={isMobileMenuOpen} 
        setIsOpen={setIsMobileMenuOpen}
      />
    </>
  )
}

function NavLink({ href, children }: { href: string; children: React.ReactNode }) {
  const pathname = usePathname();
  const isActive = pathname === href;
  
  return (
    <Link 
      href={href} 
      className={`relative py-2 text-[var(--color-blue-navy)] group ${
        isActive ? 'font-medium' : ''
      }`}
    >
      <span className="relative z-10">{children}</span>
      <div className="absolute inset-x-0 bottom-0 h-[2px] overflow-hidden">
        <div className={`h-full w-full transform origin-left transition-transform duration-300
                        ${isActive 
                          ? 'scale-x-100 bg-[var(--color-blue-navy)]' 
                          : 'scale-x-0 bg-[var(--color-cyan-DEFAULT)] group-hover:scale-x-100'}`} 
        />
      </div>
    </Link>
  );
}