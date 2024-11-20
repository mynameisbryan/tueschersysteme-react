'use client'

import Link from 'next/link'
import Image from 'next/image'
import { useState, useEffect } from 'react'
import { Bars3Icon, XMarkIcon } from '@heroicons/react/24/outline'
import MobileMenu from './MobileMenu'
import NavigationButton from '@/components/ui/NavigationButton'

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
                  e.currentTarget.src = '/images/logo.jpg'
                }}
              />
            </div>
          </Link>

          <nav className="hidden md:flex items-center space-x-8">
            <Link 
              href="/" 
              className="relative py-2 text-tuscher-blue-navy group"
            >
              <span className="relative z-10">Home</span>
              <div className="absolute inset-x-0 bottom-0 h-[2px] overflow-hidden">
                <div className="gradient-line-animation h-full transform origin-left scale-x-0 transition-transform duration-300 ease-out group-hover:scale-x-100" />
              </div>
            </Link>
            <Link 
              href="/products" 
              className="relative py-2 text-tuscher-blue-navy group"
            >
              <span className="relative z-10">Produkte</span>
              <div className="absolute inset-x-0 bottom-0 h-[2px] overflow-hidden">
                <div className="gradient-line-animation h-full transform origin-left scale-x-0 transition-transform duration-300 ease-out group-hover:scale-x-100" />
              </div>
            </Link>
            <NavigationButton 
              href="#contact-section" 
              className="relative inline-flex items-center justify-center px-6 py-2 overflow-hidden font-medium text-[#7CDDBA] bg-[#030d26] rounded-lg hover:bg-[#051633] transition-all duration-200 ease-out group border border-[#7CDDBA] shadow-[0_4px_12px_rgba(124,221,186,0.2)] hover:shadow-[0_4px_16px_rgba(124,221,186,0.4)]"
            >
              <span className="relative">Kontakt</span>
              <span className="absolute bottom-0 right-0 w-8 h-20 -mt-12 transition-all duration-300 transform translate-x-12 bg-[#7CDDBA] opacity-10 rotate-12 group-hover:-translate-x-40 ease-out"></span>
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
              width: '200%',
              transform: `translateX(${-50 + scrollPosition/2}%)`,
              transition: 'transform 0.2s ease-out',
              background: 'linear-gradient(90deg, rgba(124,221,186,0.1) 0%, #7CDDBA 35%, #8FE4C6 50%, #7CDDBA 65%, rgba(124,221,186,0.1) 100%)',
              backgroundSize: '200% 100%'
            }}
          />
          <div className="absolute inset-0 shadow-[0_2px_12px_rgba(124,221,186,0.4)]" />
        </div>
      </header>

      <MobileMenu 
        isOpen={isMobileMenuOpen} 
        setIsOpen={setIsMobileMenuOpen}
      />
    </>
  )
}