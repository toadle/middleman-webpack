DIST_PATH = File.join('.tmp', 'dist')
REV_MANIFEST_PATH = File.join(DIST_PATH, 'rev-manifest.json')
if File.exist?(REV_MANIFEST_PATH)
  REV_MANIFEST = JSON.parse(File.read(REV_MANIFEST_PATH))
end

module WebpackAssetHelper
  def webpack_asset_path(path)
    rev_manifest = nil

    # In development, check for the manifest every time
    if config[:environment].to_s != 'production'
      rev_manifest = JSON.parse(File.read(REV_MANIFEST_PATH)) if File.exist?(REV_MANIFEST_PATH)
    # In production, use the manifest cached in initializers/gulp.rb
    else
      rev_manifest = REV_MANIFEST if defined?(REV_MANIFEST)
    end
    
    asset_path = rev_manifest[path]
    File.absolute_path(asset_path, '/')
  end
end