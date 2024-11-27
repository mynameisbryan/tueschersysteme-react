'use client';
"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var ErrorBoundary = /** @class */ (function (_super) {
    __extends(ErrorBoundary, _super);
    function ErrorBoundary() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.state = {
            hasError: false
        };
        _this.handleReset = function () {
            _this.setState({ hasError: false, error: undefined });
        };
        return _this;
    }
    ErrorBoundary.getDerivedStateFromError = function (error) {
        return { hasError: true, error: error };
    };
    ErrorBoundary.prototype.componentDidCatch = function (error, errorInfo) {
        console.error('[ErrorBoundary] Caught error:', {
            error: error,
            errorInfo: errorInfo,
            stack: error.stack
        });
    };
    ErrorBoundary.prototype.render = function () {
        if (this.state.hasError) {
            return this.props.fallback || (<div className="container mx-auto px-4 py-16">
          <div className="glass-card text-center">
            <h2 className="text-xl font-bold text-tuscher-blue mb-4">
              Ein Fehler ist aufgetreten
            </h2>
            {process.env.NODE_ENV === 'development' && this.state.error && (<pre className="text-sm text-gray-600 mt-2 p-4 bg-gray-50 rounded-lg overflow-auto">
                {this.state.error.message}
              </pre>)}
            <button onClick={this.handleReset} className="btn btn-primary-light mt-6">
              Erneut versuchen
            </button>
          </div>
        </div>);
        }
        return this.props.children;
    };
    return ErrorBoundary;
}(react_1.Component));
exports.default = ErrorBoundary;
