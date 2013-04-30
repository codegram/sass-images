# The Sass::Images Railtie hooks into Rails and sets a new path resolver that
# uses the Sprockets environment to locate a particular asset inside the
# filesystem.
class Sass::Images::Railtie < Rails::Railtie
  initializer 'sass-images' do
    Sass::Images.path_resolver = lambda do |path|
      Rails.application.assets.find_asset(path).pathname
    end
  end
end if defined?(Rails)
