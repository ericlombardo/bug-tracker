const { environment } = require('@rails/webpacker')

const webpack = require("webpack") // tells program to use jquery and popper.js for entire program
environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment

