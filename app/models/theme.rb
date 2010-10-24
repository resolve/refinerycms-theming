class Theme

  def self.current_theme(env = nil)
    ::RefinerySetting[:theme]
  end

	def self.current_theme_dir
		theme = self.current_theme
		theme_dir = Rails.root.join("themes",theme)
		theme_dir = Pathname.new(__FILE__).join('..','..', '..' ,'themes', theme) unless theme_dir.exist?
		theme_dir
	end

end
