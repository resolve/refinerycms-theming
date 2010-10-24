class Theme

  def self.current_theme(env = nil)
    ::RefinerySetting[:theme]
  end

	def self.root
		Pathname.new( File.expand_path('../../../', __FILE__) )
	end

	def self.current_theme_dir
		theme = self.current_theme
		theme_dir = Rails.root.join("themes",theme)
		theme_dir = self.root.join('themes', theme) unless theme_dir.directory?
		theme_dir
	end

end
