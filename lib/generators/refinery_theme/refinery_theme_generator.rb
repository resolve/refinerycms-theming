class RefineryThemeGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)  
  argument :theme_name, :type => :string

  def create_theme
    copy_file "stylesheets/application.css", "themes/#{theme_name}/stylesheets/application.css"
    copy_file "stylesheets/formatting.css", "themes/#{theme_name}/stylesheets/formatting.css"
    copy_file "stylesheets/home.css", "themes/#{theme_name}/stylesheets/home.css"

    copy_file "views/layouts/application.html.erb", "themes/#{theme_name}/views/layouts/application.html.erb"

    copy_file "views/pages/show.html.erb", "themes/#{theme_name}/views/pages/show.html.erb"
    copy_file "views/pages/home.html.erb", "themes/#{theme_name}/views/pages/home.html.erb"

    if RefinerySetting.get(:theme).nil?
      RefinerySetting.set(:theme, theme_name)
      puts "NOTE: \"theme\" setting created and set to #{theme_name}"
    else
      puts 'NOTE: If you want this new theme to be the current theme used, set the "theme" setting in the Refinery backend to the name of this theme.' unless RAILS_ENV == "test"
    end
  end

end
