Bundler.require(:default, :development)

configure :development do
  activate :livereload, no_swf: true
end

activate :external_pipeline,
  name: :webpack,
  command: "npm start",
  source: ".tmp/dist"