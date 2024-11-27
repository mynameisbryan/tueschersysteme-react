'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var link_1 = require("next/link");
function ScrollButton(_a) {
    var href = _a.href, className = _a.className, children = _a.children, _b = _a.offset // Update to match your header height plus a small buffer
    , offset = _b === void 0 ? 90 : _b // Update to match your header height plus a small buffer
    ;
    var handleClick = function (e) {
        e.preventDefault();
        var element = document.getElementById(href.replace('#', ''));
        if (element) {
            var elementPosition = element.getBoundingClientRect().top;
            var offsetPosition = elementPosition + window.pageYOffset - offset;
            window.scrollTo({
                top: offsetPosition,
                behavior: 'smooth'
            });
        }
    };
    return (<link_1.default href={href} className={className} onClick={handleClick}>
      {children}
    </link_1.default>);
}
exports.default = ScrollButton;
