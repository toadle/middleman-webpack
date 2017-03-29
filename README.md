![bildschirmfoto 2017-03-29 um 17 45 17](https://cloud.githubusercontent.com/assets/115103/24463667/b044aebc-14a7-11e7-9d3f-7640c9b4c9af.png)


A [middleman v4](https://middlemanapp.com/) with [webpack2](https://webpack.js.org/), [bootstrap4.alpha-6](http://v4-alpha.getbootstrap.com/) and [fontawesome](http://fontawesome.io/) already integrated

# Requirements
- Ruby
- NodeJS

## How to get started

1. Clone this repo to your machine in a nice directory.
2. Create yourself a `.ruby-version` and `.ruby-gemset`-file. This has been tested with ruby version `2.3.3` and a gemset named `middleman-webpack`.
3. Run `bundle install`. Wait. 
4. Run `npm install`. Wait. 
5. Run `middleman s`.
6. You should be able to open the page at `http://localhost:3000`.
7. You can create a final production-build by running `middleman build`. 

## How does it work

- Uses `middleman`'s external pipeline to generate assets. Configuration is in the two `environment`-files `development.rb` and `production.rb`
- Runs `webpack` as it's external pipeline, as configured in `package.json`.
- `webpack` uses the the `webpack.config.js` as it's configuration. 
- When run as `middleman s` in `development` it'll start `middleman`, 'middleman-livereload', `webpack` and [BrowserSync](https://www.browsersync.io/). So reloading of templates and JS/CSS-changes should be reflected without manual reloads.
