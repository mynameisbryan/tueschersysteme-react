"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.metadata = void 0;
var google_1 = require("next/font/google");
var Layout_1 = require("@/components/layout/Layout");
require("@/styles/globals.css");
var inter = (0, google_1.Inter)({ subsets: ['latin'] });
var roboto = (0, google_1.Roboto)({
    weight: ['400', '700'],
    subsets: ['latin'],
    display: 'swap',
    variable: '--font-roboto',
});
exports.metadata = {
    title: 'Tüscher Systeme',
    description: 'Ihr Partner für innovative Systemlösungen',
};
function RootLayout(_a) {
    var children = _a.children;
    return (<html lang="de" className={"".concat(roboto.variable)}>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
      </head>
      <body className={inter.className}>
        <Layout_1.default>{children}</Layout_1.default>
      </body>
    </html>);
}
exports.default = RootLayout;
