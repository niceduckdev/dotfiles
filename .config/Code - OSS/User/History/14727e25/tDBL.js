/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
    theme: {
        extend: {
            fontFamily: {
                nunito: ["Nunito", "sans-serif"],
            }
        },
    },
    plugins: [
        require('@tailwindcss/typography'),
        require("tailwindcss-animate"),
    ],
}