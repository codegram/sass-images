class Sass::Images::Railtie < Rails::Railtie
  initializer 'sass-images' do
    Sass::Images.path_resolver = lambda do |path|
      Rails.application.assets.find_asset(path).pathname
    end
  end
end if defined?(Rails)
