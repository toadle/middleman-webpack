DIST_PATH = File.join(Dir.pwd, '.webpack_build')
REV_MANIFEST_PATH = File.join(DIST_PATH, 'rev-manifest.json')

module WebpackAssetHelper
  def webpack_asset_path(path)
  	return "webpack_build_disabled_in_tests" if config[:environment] == :test
    rev_manifest = JSON.parse(File.read(REV_MANIFEST_PATH)) if File.exist?(REV_MANIFEST_PATH)
    raise "#{REV_MANIFEST_PATH} is missing." unless rev_manifest
    
    asset_path = rev_manifest[path]
    raise "Can't find #{path} in webpack assets. See rev-manifest.json for complete list." unless asset_path
    File.absolute_path(asset_path, '/')
  end
end