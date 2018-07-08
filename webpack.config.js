 var config = {
    entry: './app/APP.jsx',
    output: {
       path:'/',
       filename: 'transpiled.js',
    },
    module: {
       rules: [
          {
             test: /\.jsx?$/,
             exclude: /node_modules/,
             loader: 'babel-loader',
             query: {
                presets: ['es2015', 'react']
             }
          }
       ]
    }
 }
 module.exports = config;