"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var link_1 = require("next/link");
var image_1 = require("next/image");
function Footer() {
    return (<footer className="bg-[var(--color-navy)] text-white relative">
      {/* Gradient Line Animation - similar to header */}
      <div className="relative h-[3px] w-full overflow-hidden">
        <div className="gradient-line-animation absolute inset-0" style={{
            width: '200%',
            transform: 'translateX(-50%)',
        }}/>
        <div className="absolute inset-0 shadow-[0_-2px_12px_rgba(124,221,186,0.4)]"/>
      </div>

      {/* Main Footer Content */}
      <div className="container mx-auto px-4 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {/* Company Info */}
          <div className="space-y-4">
            <image_1.default src="/images/logo-white-white.png" alt="Tüscher Systeme Logo" width={120} height={41} className="max-h-[41px] w-auto" style={{
            objectFit: 'contain'
        }}/>
            <p className="text-gray-400 text-sm">
              Ihr Partner für innovative Systemlösungen im Bereich Insektenschutz und mehr.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-[var(--color-primary)] font-semibold mb-4">Quick Links</h3>
            <ul className="space-y-3">
              <li>
                <link_1.default href="/" className="text-gray-400 hover:text-[var(--color-primary)] transition-colors duration-200">
                  Home
                </link_1.default>
              </li>
              <li>
                <link_1.default href="/products" className="text-gray-400 hover:text-[var(--color-primary)] transition-colors duration-200">
                  Produkte
                </link_1.default>
              </li>
              <li>
                <link_1.default href="/updates" className="text-gray-400 hover:text-[var(--color-primary)] transition-colors duration-200">
                  News
                </link_1.default>
              </li>
              <li>
                <link_1.default href="/impressum" className="text-gray-400 hover:text-[var(--color-primary)] transition-colors duration-200">
                  Impressum
                </link_1.default>
              </li>
            </ul>
          </div>

          {/* Contact Info */}
          <div>
            <h3 className="text-[var(--color-cyan-DEFAULT)] font-semibold mb-4">Kontakt</h3>
            <ul className="space-y-3 text-gray-400">
              <li className="flex items-center space-x-2">
                <svg className="w-4 h-4 text-[var(--color-cyan-DEFAULT)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
                <span>Am Bollwerk 27, 35510 Butzbach</span>
              </li>
              <li className="flex items-center space-x-2">
                <svg className="w-4 h-4 text-[var(--color-cyan-DEFAULT)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
                <span>info@tuescher.de</span>
              </li>
              <li className="flex items-center space-x-2">
                <svg className="w-4 h-4 text-[var(--color-cyan-DEFAULT)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                </svg>
                <span>+49 6033 920226</span>
              </li>
            </ul>
          </div>

          {/* Partner Logo */}
          <div className="flex flex-col items-end justify-between">
            <image_1.default src="/images/neher_logo_tr.png" alt="Neher Logo" width={120} height={120} style={{ height: 'auto' }} className="opacity-80 hover:opacity-100 transition-opacity duration-200" priority={false}/>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="mt-12 pt-8 border-t border-[var(--color-navy-light)]">
          <div className="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
            <p className="text-gray-400 text-sm">
              &copy; {new Date().getFullYear()} Tüscher Systeme. Alle Rechte vorbehalten.
            </p>
            <div className="flex space-x-6">
              <link_1.default href="/impressum" className="text-gray-400 hover:text-[#7CDDBA] text-sm transition-colors duration-200">
                Impressum
              </link_1.default>
              <link_1.default href="/datenschutz" className="text-gray-400 hover:text-[#7CDDBA] text-sm transition-colors duration-200">
                Datenschutz
              </link_1.default>
              <link_1.default href="/agb" className="text-gray-400 hover:text-[#7CDDBA] text-sm transition-colors duration-200">
                AGB
              </link_1.default>
            </div>
          </div>
        </div>
      </div>
    </footer>);
}
exports.default = Footer;
