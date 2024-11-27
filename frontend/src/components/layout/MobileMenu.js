'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var react_2 = require("@headlessui/react");
var outline_1 = require("@heroicons/react/24/outline");
var link_1 = require("next/link");
function MobileMenu(_a) {
    var isOpen = _a.isOpen, setIsOpen = _a.setIsOpen;
    return (<react_2.Transition.Root show={isOpen} as={react_1.Fragment}>
      <react_2.Dialog as="div" className="relative z-50" onClose={setIsOpen} static>
        <react_2.Transition.Child as={react_1.Fragment} enter="ease-out duration-200" enterFrom="opacity-0" enterTo="opacity-100" leave="ease-in duration-150" leaveFrom="opacity-100" leaveTo="opacity-0">
          <div className="fixed inset-0 bg-black/25 backdrop-blur-[2px]"/>
        </react_2.Transition.Child>

        <react_2.Transition.Child as={react_1.Fragment} enter="transform transition ease-out duration-250" enterFrom="translate-x-full" enterTo="translate-x-0" leave="transform transition ease-in duration-200" leaveFrom="translate-x-0" leaveTo="translate-x-full">
          <div className="fixed inset-0 overflow-hidden">
            <div className="absolute inset-0 overflow-hidden">
              <div className="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10">
                <react_2.Transition.Child as={react_1.Fragment} enter="transform transition ease-in-out duration-300" enterFrom="translate-x-full" enterTo="translate-x-0" leave="transform transition ease-in-out duration-300" leaveFrom="translate-x-0" leaveTo="translate-x-full">
                  <react_2.Dialog.Panel className="pointer-events-auto w-screen max-w-md">
                    <div className="flex h-full flex-col overflow-y-scroll bg-white text-tuscher-blue-navy">
                      <div className="px-4 sm:px-6 pt-5">
                        <div className="flex items-center justify-end">
                          <button type="button" className="rounded-md p-2 hover:bg-gray-100 transition-colors" onClick={function () { return setIsOpen(false); }}>
                            <span className="sr-only">Close menu</span>
                            <outline_1.XMarkIcon className="h-6 w-6" aria-hidden="true"/>
                          </button>
                        </div>
                      </div>
                      <div className="relative mt-6 flex-1 px-4 sm:px-6">
                        <nav className="flex flex-col space-y-6 pt-8">
                          <link_1.default href="/" className="group relative overflow-hidden px-4 py-2 text-lg" onClick={function () { return setIsOpen(false); }}>
                            <span className="relative z-10 text-[var(--color-blue-navy)] transition-colors duration-200">
                              Home
                            </span>
                            <span className="absolute inset-0 -translate-x-full bg-[var(--color-cyan-DEFAULT)]/10 
                                            transition-transform duration-200 ease-out group-hover:translate-x-0 
                                            shadow-[inset_0_0_12px_var(--color-cyan-glow)]"/>
                          </link_1.default>
                          <link_1.default href="/products" className="group relative overflow-hidden px-4 py-2 text-lg" onClick={function () { return setIsOpen(false); }}>
                            <span className="relative z-10 text-[var(--color-blue-navy)] transition-colors duration-200">
                              Produkte
                            </span>
                            <span className="absolute inset-0 -translate-x-full bg-[var(--color-cyan-DEFAULT)]/10 
                                            transition-transform duration-200 ease-out group-hover:translate-x-0 
                                            shadow-[inset_0_0_12px_var(--color-cyan-glow)]"/>
                          </link_1.default>
                          <link_1.default href="/#contact-section" className="btn-primary mx-4" onClick={function () { return setIsOpen(false); }}>
                            Kontakt
                          </link_1.default>
                        </nav>
                      </div>
                    </div>
                  </react_2.Dialog.Panel>
                </react_2.Transition.Child>
              </div>
            </div>
          </div>
        </react_2.Transition.Child>
      </react_2.Dialog>
    </react_2.Transition.Root>);
}
exports.default = MobileMenu;
