"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var config = {
    content: [
        "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
        "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
        "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
    ],
    theme: {
        extend: {
            backgroundImage: {
                'radial-gradient': 'radial-gradient(circle at center, transparent 50%, white 100%)',
                'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
            },
            colors: {
                background: 'var(--background)',
                foreground: 'var(--foreground)',
                tuscher: {
                    blue: {
                        DEFAULT: "#012970",
                        light: "#1a3d7e",
                        dark: "#021b47",
                        hover: "#003062"
                    },
                    gray: "#f9f9f9",
                    footer: "#09203B",
                    text: "#111111"
                }
            },
            fontFamily: {
                sans: ["var(--font-roboto)", "Arial", "sans-serif"],
                lato: ["var(--font-lato)", "sans-serif"]
            },
            height: {
                'screen-90': '90vh',
                'header': '80px'
            },
            maxHeight: {
                'logo': '55px'
            }
        },
    },
    plugins: [
        require('@tailwindcss/typography'),
    ],
};
exports.default = config;
