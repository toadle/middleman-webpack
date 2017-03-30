![bildschirmfoto 2017-03-29 um 17 45 17](https://cloud.githubusercontent.com/assets/115103/24463667/b044aebc-14a7-11e7-9d3f-7640c9b4c9af.png)

Middleman 4 + Webpack 2
=======================

A [middleman v4](https://middlemanapp.com/) preconfigured to use the [external pipeline](https://middlemanapp.com/advanced/external-pipeline/) with just [webpack v2](https://webpack.js.org/). Some helpful stuff is already integrated.

# Features
- [middleman 4](https://middlemanapp.com/)
- [webpack 2](https://webpack.js.org/)
- [BrowserSync](https://www.browsersync.io/) - no manual page reloads ;-)
- [Boostrap 4](https://v4-alpha.getbootstrap.com) - to start your frontend fast
- [Font Awesome 4.7.0](https://fontawesome.io) - to have those nice icons present
- [jQuery](http://jquery.com/)
- [Rspec](http://rspec.info/) - prepared to test your static site - lol.

# Requirements
* [Middleman 4.x](https://middlemanapp.com/basics/install/)
* [Ruby 2.x](https://github.com/rbenv/rbenv#readme)
* [Node 5.x](https://github.com/creationix/nvm#readme)
* [Webpack 2](https://webpack.js.org/)

## How to get started

(optional). Create yourself a `.ruby-version` and `.ruby-gemset`-file to not mess up your environment. I'd recommend to use [rbenv](https://github.com/rbenv/rbenv) to manage that environment. This has been tested with ruby version `2.3.3` and a gemset named `middleman-webpack`.

1. `gem install middleman`
2. Start a new middleman-project using 

       $ middleman init my_new_site -T toadle/middleman-webpack

2b. `middleman` will run `bundle install` for you. So wait.
3. Run `npm install`. Wait. 
4. Run `middleman s`.
5. You should be able to open the page at `http://localhost:3000`.
6. You can create a production-build by running `middleman build`. 
7. Run tests by `rake` or `rspec`. 

## How does it work

- Uses `middleman`'s external pipeline to generate assets. Configuration is in the two `environment`-files `development.rb` and `production.rb`
- Runs `webpack` as it's external pipeline, as configured in `package.json`.
- `webpack` uses the the `webpack.config.js` as it's configuration. 
- When run as `middleman s` in `development` it'll start `middleman`, `middleman-livereload`, `webpack` and [BrowserSync](https://www.browsersync.io/). So reloading of templates and JS/CSS-changes should be reflected without manual reloads.
- BrowserSync is configured to proxy the middleman-server from `localhost:4567` to `localhost:3000` to inject itself. 
- Stuff `webpack` does is put into `.webpack_build` which `middleman` serves together with it's own files.
