"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
Object.defineProperty(exports, "__esModule", { value: true });
var react_1 = require("react");
var FunnelContext_1 = require("../FunnelContext");
var FunnelStep_1 = require("@/components/salesfunnel/FunnelStep");
var framer_motion_1 = require("framer-motion");
var InputField = function (_a) {
    var id = _a.id, label = _a.label, _b = _a.type, type = _b === void 0 ? 'text' : _b, value = _a.value, onChange = _a.onChange, _c = _a.error, error = _c === void 0 ? '' : _c, _d = _a.required, required = _d === void 0 ? false : _d;
    return (<div className="relative mb-6">
    <input type={type} id={id} value={value} onChange={function (e) { return onChange(e.target.value); }} className={"peer block w-full rounded border-2 ".concat(error ? 'border-red-500' : 'border-tuscher-blue/20', " bg-white/80 py-3 px-4 text-tuscher-blue placeholder-transparent\n        focus:border-tuscher-cyan focus:outline-none focus:ring-0")} placeholder={label} required={required}/>
    <label htmlFor={id} className={"absolute -top-2.5 left-3 bg-white px-1 text-sm \n        ".concat(error ? 'text-red-500' : 'text-tuscher-blue/70')}>
      {label}{required && '*'}
    </label>
    {error && <p className="mt-1 text-sm text-red-500">{error}</p>}
  </div>);
};
var Step5Contact = function () {
    var _a = (0, FunnelContext_1.useFunnel)(), state = _a.state, updateState = _a.updateState, nextStep = _a.nextStep, previousStep = _a.previousStep, currentStep = _a.currentStep;
    var _b = (0, react_1.useState)(state.contact || {
        name: '',
        email: '',
        phone: '',
        company: '',
        wantContact: false,
        method: undefined,
        time: undefined,
        privacy: false
    }), contact = _b[0], setContact = _b[1];
    var _c = (0, react_1.useState)({}), errors = _c[0], setErrors = _c[1];
    var validateForm = function () {
        var newErrors = {};
        if (!contact.name)
            newErrors.name = 'Name ist erforderlich';
        if (!contact.email)
            newErrors.email = 'Email ist erforderlich';
        if (contact.email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contact.email)) {
            newErrors.email = 'Ungültige Email-Adresse';
        }
        if (contact.wantContact && !contact.method) {
            newErrors.method = 'Bitte wählen Sie eine Kontaktart';
        }
        if (contact.wantContact && !contact.time) {
            newErrors.time = 'Bitte wählen Sie eine Uhrzeit';
        }
        if (!contact.privacy) {
            newErrors.privacy = 'Bitte stimmen Sie der Datenverarbeitung zu';
        }
        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };
    var handleNext = function () {
        if (validateForm()) {
            console.log('Contact state before update:', contact);
            updateState({ contact: contact });
            setTimeout(function () {
                console.log('Moving to next step');
                nextStep();
            }, 0);
        }
    };
    return (<FunnelStep_1.default title="Kontaktinformationen" subtitle="Bitte geben Sie Ihre Kontaktdaten an" onNext={handleNext} onBack={previousStep} isValid={contact.name && contact.email && contact.privacy &&
            (!contact.wantContact || (contact.method && contact.time))} currentStep={currentStep} totalSteps={6}>
      <framer_motion_1.motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="glass-card max-w-2xl mx-auto">
        <div className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField id="name" label="Name" value={contact.name} onChange={function (value) { return setContact(function (prev) { return (__assign(__assign({}, prev), { name: value })); }); }} error={errors.name} required/>
            <InputField id="email" label="Email" type="email" value={contact.email} onChange={function (value) { return setContact(function (prev) { return (__assign(__assign({}, prev), { email: value })); }); }} error={errors.email} required/>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <InputField id="phone" label="Telefon" type="tel" value={contact.phone} onChange={function (value) { return setContact(function (prev) { return (__assign(__assign({}, prev), { phone: value })); }); }} error={errors.phone} required/>
            <InputField id="company" label="Unternehmen (falls zutreffend)" value={contact.company} onChange={function (value) { return setContact(function (prev) { return (__assign(__assign({}, prev), { company: value })); }); }} error={errors.company}/>
          </div>

          <div className="space-y-4">
            <label className="flex items-start space-x-3">
              <input type="checkbox" checked={contact.wantContact} onChange={function (e) { return setContact(function (prev) { return (__assign(__assign({}, prev), { wantContact: e.target.checked, method: e.target.checked ? prev.method : undefined, time: e.target.checked ? prev.time : undefined })); }); }} className="mt-1 rounded border-tuscher-blue/20 text-tuscher-cyan 
                         focus:ring-tuscher-cyan/30"/>
              <span className="text-sm text-tuscher-blue/70">
                Ich möchte kontaktiert werden
              </span>
            </label>

            {contact.wantContact && (<div className="space-y-4 pl-4 sm:pl-8">
                <div>
                  <label className="block text-sm font-medium text-tuscher-blue mb-2">
                    Kontaktart
                  </label>
                  <div className="grid grid-cols-2 gap-2">
                    {[
                { value: 'phone', label: 'Telefon', icon: '📞', description: 'Wir rufen Sie an' },
                { value: 'email', label: 'E-Mail', icon: '✉️', description: 'Wir schreiben Ihnen' }
            ].map(function (method) { return (<framer_motion_1.motion.button key={method.value} onClick={function () { return setContact(function (prev) { return (__assign(__assign({}, prev), { method: method.value })); }); }} className={"\n                          p-3 sm:p-6 rounded-lg border text-left transition-all\n                          ".concat(contact.method === method.value
                    ? 'border-tuscher-blue bg-tuscher-blue/5'
                    : 'border-gray-200 hover:border-gray-300', "\n                        ")} whileHover={{ scale: 1.01 }} whileTap={{ scale: 0.99 }}>
                        <div className="flex items-center space-x-2 sm:space-x-4">
                          <span className="hidden sm:inline text-2xl">{method.icon}</span>
                          <div>
                            <h3 className="font-medium text-sm sm:text-lg text-gray-900">
                              {method.label}
                            </h3>
                            <p className="text-gray-600 text-xs sm:text-sm mt-0.5 sm:mt-1 hidden sm:block">
                              {method.description}
                            </p>
                          </div>
                        </div>
                      </framer_motion_1.motion.button>); })}
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-tuscher-blue mb-2">
                    Gewünschte Uhrzeit
                  </label>
                  <div className="grid grid-cols-2 gap-2">
                    {[
                { value: '09:00', label: 'Morgens', icon: '🌅', description: '8:00 - 10:00' },
                { value: '12:00', label: 'Mittags', icon: '☀️', description: '11:00 - 13:00' },
                { value: '15:00', label: 'Nachmittags', icon: '🌤️', description: '14:00 - 16:00' },
                { value: '18:00', label: 'Abends', icon: '🌆', description: '17:00 - 19:00' }
            ].map(function (timeSlot) { return (<framer_motion_1.motion.button key={timeSlot.value} onClick={function () { return setContact(function (prev) { return (__assign(__assign({}, prev), { time: timeSlot.value })); }); }} className={"\n                          p-3 sm:p-6 rounded-lg border text-left transition-all\n                          ".concat(contact.time === timeSlot.value
                    ? 'border-tuscher-blue bg-tuscher-blue/5'
                    : 'border-gray-200 hover:border-gray-300', "\n                        ")} whileHover={{ scale: 1.01 }} whileTap={{ scale: 0.99 }}>
                        <div className="flex items-center space-x-2 sm:space-x-4">
                          <span className="hidden sm:inline text-2xl">{timeSlot.icon}</span>
                          <div>
                            <h3 className="font-medium text-sm sm:text-lg text-gray-900">
                              {timeSlot.label}
                            </h3>
                            <p className="text-gray-600 text-xs sm:text-sm mt-0.5 sm:mt-1 hidden sm:block">
                              {timeSlot.description}
                            </p>
                          </div>
                        </div>
                      </framer_motion_1.motion.button>); })}
                  </div>
                </div>
              </div>)}
          </div>

          <div className="space-y-4 mt-6">
            <label className="flex items-start space-x-3">
              <input type="checkbox" checked={contact.privacy} onChange={function (e) { return setContact(function (prev) { return (__assign(__assign({}, prev), { privacy: e.target.checked })); }); }} className="mt-1 rounded border-tuscher-blue/20 text-tuscher-cyan 
                         focus:ring-tuscher-cyan/30"/>
              <span className="text-sm text-tuscher-blue/70">
                Ich stimme der Verarbeitung meiner Daten zu*
              </span>
            </label>
            {errors.privacy && <p className="text-sm text-red-500">{errors.privacy}</p>}
          </div>
        </div>
      </framer_motion_1.motion.div>
    </FunnelStep_1.default>);
};
exports.default = Step5Contact;
