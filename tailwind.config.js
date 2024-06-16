module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        customGreen: '#008F7E',
        customLiteGreen: '#96CB8E',
        customWhite: '#E3E3E3',
        customBlue: '#9BADCB',
        primary: '#008F7E',
      },
    },
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#008F7E",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}
