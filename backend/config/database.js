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
exports.default = (function (_a) {
    var env = _a.env;
    var client = env('DATABASE_CLIENT', 'postgres');
    var connections = {
        postgres: {
            connection: {
                host: env('DATABASE_HOST'),
                port: env.int('DATABASE_PORT'),
                database: env('DATABASE_NAME'),
                user: env('DATABASE_USERNAME'),
                password: env('DATABASE_PASSWORD'),
                ssl: env.bool('DATABASE_SSL', false) ? {
                    rejectUnauthorized: env.bool('DATABASE_SSL_REJECT_UNAUTHORIZED', true),
                } : false,
                schema: env('DATABASE_SCHEMA', 'public'),
            },
            pool: {
                min: env.int('DATABASE_POOL_MIN', 2),
                max: env.int('DATABASE_POOL_MAX', 10),
            },
        },
    };
    return {
        connection: __assign(__assign({ client: client }, connections[client]), { acquireConnectionTimeout: env.int('DATABASE_CONNECTION_TIMEOUT', 60000) }),
    };
});
