'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var link_1 = require("next/link");
var image_1 = require("next/image");
var react_1 = require("react");
var outline_1 = require("@heroicons/react/24/outline");
var MobileMenu_1 = require("./MobileMenu");
var NavigationButton_1 = require("@/components/ui/NavigationButton");
var navigation_1 = require("next/navigation");
function Header() {
    var _a = (0, react_1.useState)(false), isScrolled = _a[0], setIsScrolled = _a[1];
    var _b = (0, react_1.useState)(false), isMobileMenuOpen = _b[0], setIsMobileMenuOpen = _b[1];
    var _c = (0, react_1.useState)(0), scrollPosition = _c[0], setScrollPosition = _c[1];
    (0, react_1.useEffect)(function () {
        var handleScroll = function () {
            setIsScrolled(window.scrollY > 0);
            var maxScroll = document.documentElement.scrollHeight - window.innerHeight;
            var currentScroll = window.scrollY;
            var scrollPercentage = (currentScroll / maxScroll) * 100;
            setScrollPosition(scrollPercentage * 2);
        };
        window.addEventListener('scroll', handleScroll);
        return function () { return window.removeEventListener('scroll', handleScroll); };
    }, []);
    return (<>
      <header className={"fixed w-full z-50 transition-all duration-300 ".concat(isScrolled ? 'bg-white shadow-lg' : 'bg-white')}>
        <div className="container-padding flex items-center justify-between h-header">
          <link_1.default href="/" className="flex items-center">
            <div style={{ position: 'relative', width: '160px', height: '55px' }}>
              <image_1.default src="/images/logo.jpg" alt="Tüscher Systeme Logo" fill sizes="160px" priority style={{
            objectFit: 'contain'
        }} onError={function (e) {
            console.error('Error loading logo image');
            e.currentTarget.src = '/logo.png';
        }}/>
            </div>
          </link_1.default>

          <nav className="hidden md:flex items-center space-x-8">
            <NavLink href="/">Home</NavLink>
            <NavLink href="/products">Produkte</NavLink>
            <NavigationButton_1.default href="#contact-section" className="btn-primary">
              <span className="relative">Kontakt</span>
            </NavigationButton_1.default>
          </nav>

          <button className="md:hidden text-tuscher-blue-navy p-2 hover:bg-gray-100 rounded-md transition-colors" onClick={function () { return setIsMobileMenuOpen(!isMobileMenuOpen); }} aria-label="Toggle menu">
            {isMobileMenuOpen ? (<outline_1.XMarkIcon className="h-6 w-6"/>) : (<outline_1.Bars3Icon className="h-6 w-6"/>)}
          </button>
        </div>
        
        <div className="relative h-[3px] w-full overflow-hidden">
          <div className="absolute inset-0" style={{
            background: "linear-gradient(90deg, \n                var(--color-blue-navy) 0%, \n                var(--color-cyan-DEFAULT) 25%, \n                var(--color-cyan-light) 50%, \n                var(--color-cyan-DEFAULT) 75%, \n                var(--color-blue-navy) 100%)",
            backgroundSize: '400% 100%',
            backgroundPosition: "".concat(-scrollPosition, "% 0"),
            opacity: isScrolled ? '0.8' : '1',
            transition: 'opacity 0.3s ease-out',
            width: '100%',
            willChange: 'background-position'
        }}/>
          <div className="absolute inset-0" style={{
            boxShadow: isScrolled
                ? '0 -1px 8px var(--color-cyan-glow)'
                : '0 -2px 12px var(--color-cyan-glow)'
        }}/>
        </div>
      </header>

      <MobileMenu_1.default isOpen={isMobileMenuOpen} setIsOpen={setIsMobileMenuOpen}/>
    </>);
}
exports.default = Header;
function NavLink(_a) {
    var href = _a.href, children = _a.children;
    var pathname = (0, navigation_1.usePathname)();
    var isActive = pathname === href;
    return (<link_1.default href={href} className={"relative py-2 text-[var(--color-blue-navy)] group ".concat(isActive ? 'font-medium' : '')}>
      <span className="relative z-10">{children}</span>
      <div className="absolute inset-x-0 bottom-0 h-[2px] overflow-hidden">
        <div className={"h-full w-full transform origin-left transition-transform duration-300\n                        ".concat(isActive
            ? 'scale-x-100 bg-[var(--color-blue-navy)]'
            : 'scale-x-0 bg-[var(--color-cyan-DEFAULT)] group-hover:scale-x-100')}/>
      </div>
    </link_1.default>);
}
