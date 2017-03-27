var webpack = require('webpack');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
var path = require('path');
var ManifestPlugin = require('webpack-manifest-plugin');
var CleanWebpackPlugin = require('clean-webpack-plugin');

const extractSass = new ExtractTextPlugin({
  filename: "bundle-[hash].css"
});

const outputPath = path.join(__dirname, '.tmp', 'dist');

module.exports = {
  entry: [path.join(__dirname, '/index.js')],

  output: {
    path: outputPath,
    filename: 'bundle-[hash].js',
    publicPath: '/'
  },

  resolve: {
    modules: [
      'node_modules'
    ]
  },

  module: {
    rules: [
      {
        test: /\.(woff|woff2|eot|ttf|svg|ico|jpg|jpeg|png)$/,
        use: [
          {
            loader: 'url-loader?limit=5000&name=./assets/[name]-[hash].[ext]'
          }
        ]
      },
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: ['es2015']
            }
          }
        ]
      },
      {
        test: /\.(css|scss)$/,
        use: extractSass.extract({
          fallbackLoader: [{
              loader: 'style-loader',
          }],
          use: [{
            loader: "css-loader"
          }, {
            loader: "sass-loader"
          }]
        })
      }
    ]
  },

  plugins: [
    extractSass,
    new ManifestPlugin({
      fileName: 'rev-manifest.json'
    }),
    new CleanWebpackPlugin([outputPath], {
      root: __dirname
    })
  ]
};
