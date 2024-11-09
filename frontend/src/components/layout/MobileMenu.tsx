'use client'

import { Fragment } from 'react'
import { Dialog, Transition } from '@headlessui/react'
import { XMarkIcon } from '@heroicons/react/24/outline'
import Link from 'next/link'

interface MobileMenuProps {
  isOpen: boolean
  setIsOpen: (isOpen: boolean) => void
}

export default function MobileMenu({ isOpen, setIsOpen }: MobileMenuProps) {
  return (
    <Transition.Root show={isOpen} as={Fragment}>
      <Dialog 
        as="div" 
        className="relative z-50" 
        onClose={setIsOpen}
        static
      >
        <Transition.Child
          as={Fragment}
          enter="ease-out duration-200"
          enterFrom="opacity-0"
          enterTo="opacity-100"
          leave="ease-in duration-150"
          leaveFrom="opacity-100"
          leaveTo="opacity-0"
        >
          <div className="fixed inset-0 bg-black/25 backdrop-blur-[2px]" />
        </Transition.Child>

        <Transition.Child
          as={Fragment}
          enter="transform transition ease-out duration-250"
          enterFrom="translate-x-full"
          enterTo="translate-x-0"
          leave="transform transition ease-in duration-200"
          leaveFrom="translate-x-0"
          leaveTo="translate-x-full"
        >
          <div className="fixed inset-0 overflow-hidden">
            <div className="absolute inset-0 overflow-hidden">
              <div className="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10">
                <Transition.Child
                  as={Fragment}
                  enter="transform transition ease-in-out duration-300"
                  enterFrom="translate-x-full"
                  enterTo="translate-x-0"
                  leave="transform transition ease-in-out duration-300"
                  leaveFrom="translate-x-0"
                  leaveTo="translate-x-full"
                >
                  <Dialog.Panel className="pointer-events-auto w-screen max-w-md">
                    <div className="flex h-full flex-col overflow-y-scroll bg-[#030d26] text-white">
                      <div className="px-4 sm:px-6 pt-5">
                        <div className="flex items-center justify-end">
                          <button
                            type="button"
                            className="rounded-md p-2 hover:bg-[#051633] transition-colors"
                            onClick={() => setIsOpen(false)}
                          >
                            <span className="sr-only">Close menu</span>
                            <XMarkIcon className="h-6 w-6" aria-hidden="true" />
                          </button>
                        </div>
                      </div>
                      <div className="relative mt-6 flex-1 px-4 sm:px-6">
                        <nav className="flex flex-col space-y-6 pt-8">
                          <Link 
                            href="/" 
                            className="group relative overflow-hidden px-4 py-2 text-lg"
                            onClick={() => setIsOpen(false)}
                          >
                            <span className="relative z-10 text-white transition-colors duration-200">Home</span>
                            <span className="absolute inset-0 -translate-x-full bg-[#7CDDBA]/10 transition-transform duration-200 ease-out group-hover:translate-x-0 shadow-[inset_0_0_12px_rgba(124,221,186,0.2)]" />
                          </Link>
                          <Link 
                            href="/products" 
                            className="group relative overflow-hidden px-4 py-2 text-lg"
                            onClick={() => setIsOpen(false)}
                          >
                            <span className="relative z-10 text-white transition-colors duration-200">Produkte</span>
                            <span className="absolute inset-0 -translate-x-full bg-[#7CDDBA]/10 transition-transform duration-200 ease-out group-hover:translate-x-0 shadow-[inset_0_0_12px_rgba(124,221,186,0.2)]" />
                          </Link>
                          <Link 
                            href="/contact" 
                            className="mx-4 transform overflow-hidden rounded-lg bg-[#030d26] border border-[#7CDDBA] text-[#7CDDBA] px-6 py-3 text-center text-lg font-medium transition-all duration-200 ease-out hover:bg-[#051633] hover:shadow-[0_4px_16px_rgba(124,221,186,0.4)] active:scale-95 shadow-[0_4px_12px_rgba(124,221,186,0.2)]"
                            onClick={() => setIsOpen(false)}
                          >
                            Kontakt
                          </Link>
                        </nav>
                      </div>
                    </div>
                  </Dialog.Panel>
                </Transition.Child>
              </div>
            </div>
          </div>
        </Transition.Child>
      </Dialog>
    </Transition.Root>
  )
} 