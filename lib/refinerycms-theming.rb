require File.expand_path('../theming', __FILE__)

module Refinery
  class ThemingEngine < ::Rails::Engine

    config.to_prepare do
      [::ApplicationController, ::Admin::BaseController].each do |controller|
        controller.module_eval do

          # Add or remove theme paths to/from Refinery application
          prepend_before_filter :attach_theme_to_refinery

          def attach_theme_to_refinery
            # remove any paths relating to any theme.
            view_paths.reject! { |v| v.to_s =~ %r{^themes/} }

            # add back theme paths if there is a theme present.
            if (theme = ::Theme.current_theme(request.env)).present?
              # Set up view path again for the current theme.
              view_paths.unshift ::Theme.current_theme_dir.join("views").to_s

              # Ensure that routes within the application are top priority.
              # Here we grab all the routes that are under the application's view folder
              # and promote them ahead of any other path.
              view_paths.select{|p| p.to_s =~ %r{^#{Rails.root.join('app', 'views')}}}.each do |app_path|
                view_paths.unshift app_path
              end
            end

            # Set up menu caching for this theme or lack thereof
            if RefinerySetting.table_exists? and
               RefinerySetting.get(:refinery_menu_cache_action_suffix) != (suffix = "#{"#{theme}_" if theme.present?}site_menu")
              RefinerySetting.set(:refinery_menu_cache_action_suffix, suffix)
            end
          end
          protected :attach_theme_to_refinery
        end

      end

      ::ApplicationHelper.module_eval do
        def image_tag(source, options={})
          theme = (options.delete(:theme) == true)
          tag = super
          # inject /theme/ into the image tag src if this is themed.
          tag.gsub!(/src=[\"|\']/) { |m| "#{m}/theme/" }.gsub!("//", "/") if theme
          tag.gsub(/theme=(.+?)\ /, '') # we need to remove any addition of theme='false' etc.
        end

        def javascript_include_tag(*sources)
          theme = (arguments = sources.dup).extract_options![:theme] == true # don't ruin the current sources object
          tag = super
          # inject /theme/ into the javascript include tag src if this is themed.
          tag.gsub!(/\/javascripts\//, "/theme/javascripts/") if theme
          tag.gsub(/theme=(.+?)\ /, '') # we need to remove any addition of theme='false' etc.
        end

        def stylesheet_link_tag(*sources)
          theme = (arguments = sources.dup).extract_options![:theme] == true # don't ruin the current sources object
          tag = super
          # inject /theme/ into the stylesheet link tag href if this is themed.
          tag.gsub!(/\/stylesheets\//, "/theme/stylesheets/") if theme
          tag.gsub(/theme=(.+?)\ /, '') # we need to remove any addition of theme='false' etc.
        end

        def image_submit_tag(source, options = {})
          theme = (options.delete(:theme) == true)

          tag = super
          # inject /theme/ into the image tag src if this is themed.
          tag.gsub!(/src=[\"|\']/) { |m| "#{m}/theme/" }.gsub!("//", "/") if theme
          tag.gsub(/theme=(.+?)\ /, '') # we need to remove any addition of theme='false' etc.
        end
      end
    end

    config.after_initialize do
      ::Refinery::Plugin.register do |plugin|
        plugin.name = "refinerycms_theming_plugin"
        plugin.version = '0.9.9.1'
      end
    end

    initializer 'themes.middleware' do |app|
      app.config.middleware.insert_before ::ActionDispatch::Static, ::Refinery::ThemeServer
    end

  end
end
