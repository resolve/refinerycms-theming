require File.expand_path('../../../lib/generators/refinery_theme/refinery_theme_generator', __FILE__)

Before do
  @theme_generator_root  = File.join(File.dirname(__FILE__), "/../../")
  @tmp_refinery_app_name  = "tmp_refinery_app"
  require 'tmpdir'
  @tmp_refinery_app_root  = File.join(Dir.tmpdir, @tmp_refinery_app_name)
  @app_root = @tmp_refinery_app_root
end

After do
  FileUtils.rm_rf(@tmp_refinery_app_root)
end

When /^I generate a theme with the name "([^\"]*)"$/ do |name|
  generator = RefineryThemeGenerator.new([name])
  generator.destination_root = @app_root
  generator.options = {:quiet => true}
  generator.generate
end
