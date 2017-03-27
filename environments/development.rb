configure :development do
  activate :livereload
end

activate :external_pipeline,
  name: :webpack,
  command: "npm start",
  source: ".tmp/dist"