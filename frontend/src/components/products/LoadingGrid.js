"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function LoadingGrid() {
    return (<div className="container mx-auto px-4 py-12">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        {[1, 2, 3, 4, 5, 6].map(function (index) { return (<div key={index} className="animate-pulse">
            <div className="bg-gray-200 h-48 rounded-t-lg"/>
            <div className="p-4 space-y-3">
              <div className="h-6 bg-gray-200 rounded w-3/4"/>
              <div className="h-4 bg-gray-200 rounded w-full"/>
              <div className="h-4 bg-gray-200 rounded w-2/3"/>
            </div>
          </div>); })}
      </div>
    </div>);
}
exports.default = LoadingGrid;
