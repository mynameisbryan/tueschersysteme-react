"use strict";
var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.LoadingState = void 0;
// Create new LoadingState.tsx
function LoadingState() {
    return (<div className="animate-pulse space-y-8 p-4">
        <div className="h-[400px] bg-gray-200 rounded-lg"/>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {__spreadArray([], Array(6), true).map(function (_, i) { return (<div key={i} className="space-y-4">
              <div className="aspect-[4/3] bg-gray-200 rounded-lg"/>
              <div className="h-4 bg-gray-200 rounded w-3/4"/>
              <div className="h-4 bg-gray-200 rounded w-1/2"/>
            </div>); })}
        </div>
      </div>);
}
exports.LoadingState = LoadingState;
