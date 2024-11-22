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
      const position = (window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)) * 100
      setScrollPosition(position)
    }
    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  const gradientPosition = `${scrollPosition}%`

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
              className="group relative inline-flex items-center justify-center 
                        px-6 py-3 rounded-lg overflow-hidden
                        bg-tuscher-blue text-white
                        shadow-lg
                        hover:shadow-xl
                        hover:bg-tuscher-blue-light
                        transition-all duration-300"
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
            className="absolute inset-0 animate-gradientFlow"
            style={{
              background: 'linear-gradient(90deg, rgba(3,13,38,0.1) 0%, #0B84B5 35%, #41B8D5 50%, #0B84B5 65%, rgba(3,13,38,0.1) 100%)',
              backgroundSize: '200% 100%',
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
      className={`relative py-2 text-tuscher-blue-navy group ${
        isActive ? 'text-tuscher-blue' : ''
      }`}
    >
      <span className="relative z-10">{children}</span>
      <div className="absolute inset-x-0 bottom-0 h-[2px] overflow-hidden">
        <div className={`h-full w-full transform origin-left transition-transform duration-300
                        bg-gradient-to-r from-[#0B84B5] via-[#41B8D5] to-[#0B84B5]
                        ${isActive ? 'scale-x-100' : 'scale-x-0 group-hover:scale-x-100'}`} 
        />
      </div>
    </Link>
  );
}