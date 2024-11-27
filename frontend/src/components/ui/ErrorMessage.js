"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// frontend/src/components/ui/ErrorMessage.tsx
function ErrorMessage(_a) {
    var message = _a.message;
    return (<div className="bg-red-50 border border-red-200 rounded-lg p-4">
        <p className="text-red-700">{message}</p>
      </div>);
}
exports.default = ErrorMessage;
