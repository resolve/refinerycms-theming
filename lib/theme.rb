module Theme
  class << self
    def current_theme(env = nil)
      ::RefinerySetting[:theme]
    end

    def root
      Pathname.new( File.expand_path('../../', __FILE__) )
    end

    def current_theme_dir
      theme = self.current_theme
      theme_dir = Rails.root.join("themes",theme)
      theme_dir = self.root.join('themes', theme) unless theme_dir.directory?
      theme_dir
    end
  end
end