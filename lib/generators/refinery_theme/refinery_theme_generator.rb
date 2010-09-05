class RefineryThemeGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)  
  argument :theme_name, :type => :string, :default => nil  


  def create_theme
    if theme_name.nil?
      puts "You must specify a theme name."
      puts banner
      exit
    end

    copy_file "stylesheets/application.css", "themes/#{theme_name}/stylesheets/application.css"
    copy_file "stylesheets/formatting.css", "themes/#{theme_name}/stylesheets/formatting.css"
    copy_file "stylesheets/home.css", "themes/#{theme_name}/stylesheets/home.css"

    copy_file "views/layouts/application.html.erb", "themes/#{theme_name}/views/layouts/application.html.erb"

    copy_file "views/pages/show.html.erb", "themes/#{theme_name}/views/pages/show.html.erb"
    copy_file "views/pages/home.html.erb", "themes/#{theme_name}/views/pages/home.html.erb"

    puts 'NOTE: If you want this new theme to be the current theme used, set the "theme"
          setting in the Refinery backend to the name of this theme.' unless RAILS_ENV == "test"
  end
  
  private

  def banner
    "Usage: rails generate refinery_theme theme_name"
  end
  
end


