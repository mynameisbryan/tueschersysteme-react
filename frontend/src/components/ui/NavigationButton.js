'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var navigation_1 = require("next/navigation");
var link_1 = require("next/link");
function NavigationButton(_a) {
    var href = _a.href, className = _a.className, children = _a.children, _b = _a.offset, offset = _b === void 0 ? 90 : _b;
    var router = (0, navigation_1.useRouter)();
    var pathname = (0, navigation_1.usePathname)();
    var handleClick = function (e) {
        e.preventDefault();
        if (pathname === '/') {
            // If we're on home page, scroll to the section
            var element = document.getElementById(href.replace('#', ''));
            if (element) {
                var elementPosition = element.getBoundingClientRect().top;
                var offsetPosition = elementPosition + window.pageYOffset - offset;
                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });
            }
        }
        else {
            // If we're on another page, navigate to home and then scroll
            router.push("/".concat(href));
        }
    };
    return (<link_1.default href={href} className={className} onClick={handleClick}>
      {children}
    </link_1.default>);
}
exports.default = NavigationButton;
