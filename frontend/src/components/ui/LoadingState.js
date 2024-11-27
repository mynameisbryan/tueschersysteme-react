"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LoadingState = void 0;
var react_1 = require("react");
var LoadingState = function () {
    return (<div className="animate-pulse space-y-4">
      {[1, 2, 3].map(function (i) { return (<div key={i} className="h-24 bg-gray-200 rounded-lg"/>); })}
    </div>);
};
exports.LoadingState = LoadingState;
