if REV_MANIFEST
  REV_MANIFEST.each do |key, value|
    ignore key
  end
end

# Ignore the actual manifest file
ignore 'rev-manifest.json'

activate :external_pipeline,
  name: :webpack,
  command: "npm build",
  source: ".tmp/dist"