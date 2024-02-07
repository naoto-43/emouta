const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('daisyui')
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          // 用意されている各種の色も設定できる
          primary: "#a991f7", // btn-primaryなどの背景の色
          "primary-content": "#ffffff", // btn-primaryなどの文字の色
          "base-100": "#16253D", // 全体の背景色
          "base-content": "#EFB509", // 全体の文字の色
        },
      }
    ],
  }
}
