Gem::Specification.new do |s|
  s.name              = %q{refinerycms-theming}
  s.version           = %q{0.9.9.1}
  s.description       = %q{Theming functionality for the Refinery CMS project, extracted from Refinery CMS core.}
  s.date              = %q{2011-02-16}
  s.summary           = %q{Theming functionality for the Refinery CMS project.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital)
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = [
    'app',
    'app/models',
    'app/models/theme.rb',
    'features',
    'features/step_definitions',
    'features/step_definitions/theme_generator_steps.rb',
    'features/theme_generator.feature',
    'lib',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinery_theme',
    'lib/generators/refinery_theme/Rakefile',
    'lib/generators/refinery_theme/README',
    'lib/generators/refinery_theme/refinery_theme_generator.rb',
    'lib/generators/refinery_theme/templates',
    'lib/generators/refinery_theme/templates/javascripts',
    'lib/generators/refinery_theme/templates/javascripts/application.js',
    'lib/generators/refinery_theme/templates/stylesheets',
    'lib/generators/refinery_theme/templates/stylesheets/application.css',
    'lib/generators/refinery_theme/templates/stylesheets/formatting.css',
    'lib/generators/refinery_theme/templates/stylesheets/home.css',
    'lib/generators/refinery_theme/templates/views',
    'lib/generators/refinery_theme/templates/views/layouts',
    'lib/generators/refinery_theme/templates/views/layouts/application.html.erb',
    'lib/generators/refinery_theme/templates/views/pages',
    'lib/generators/refinery_theme/templates/views/pages/home.html.erb',
    'lib/generators/refinery_theme/templates/views/pages/show.html.erb',
    'lib/generators/refinery_theme/USAGE',
    'lib/refinerycms-theming.rb',
    'lib/theme_server.rb',
    'lib/theming.rb',
    'license.md',
    'readme.md',
    'refinerycms-theming.gemspec',
    'themes',
    'themes/demolicious',
    'themes/demolicious/images',
    'themes/demolicious/images/footer_background.png',
    'themes/demolicious/images/header_background.png',
    'themes/demolicious/LICENSE',
    'themes/demolicious/README',
    'themes/demolicious/stylesheets',
    'themes/demolicious/stylesheets/application.css',
    'themes/demolicious/stylesheets/formatting.css',
    'themes/demolicious/stylesheets/home.css',
    'themes/demolicious/stylesheets/ie6.css',
    'themes/demolicious/stylesheets/ie7.css',
    'themes/demolicious/views',
    'themes/demolicious/views/layouts',
    'themes/demolicious/views/layouts/application.html.erb',
    'themes/demolicious/views/pages',
    'themes/demolicious/views/pages/home.html.erb',
    'themes/demolicious/views/pages/show.html.erb',
    'themes/hemingway',
    'themes/hemingway/images',
    'themes/hemingway/images/archives.gif',
    'themes/hemingway/images/footer_black.gif',
    'themes/hemingway/images/kyle-header.jpg',
    'themes/hemingway/images/readon_black.gif',
    'themes/hemingway/images/search.gif',
    'themes/hemingway/images/spinner.gif',
    'themes/hemingway/images/trackback_pingback.gif',
    'themes/hemingway/LICENSE',
    'themes/hemingway/README',
    'themes/hemingway/stylesheets',
    'themes/hemingway/stylesheets/application.css',
    'themes/hemingway/stylesheets/formatting.css',
    'themes/hemingway/stylesheets/home.css',
    'themes/hemingway/views',
    'themes/hemingway/views/layouts',
    'themes/hemingway/views/layouts/application.html.erb'
  ]
  

  s.add_dependency('refinerycms', '>= 0.9.9')
end
