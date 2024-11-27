"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var Header_1 = require("./Header");
var Footer_1 = require("./Footer");
function Layout(_a) {
    var children = _a.children;
    return (<div className="flex flex-col min-h-screen">
      <Header_1.default />
      <main className="flex-grow">
        {children}
      </main>
      <Footer_1.default />
    </div>);
}
exports.default = Layout;
