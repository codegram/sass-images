require 'mini_magick'
require 'sass'
require_relative 'image'

module Sass::Images
  module Functions
    def image_width(path)
      image = Image.new(resolve_path path)
      Sass::Script::Number.new image.width, ['px']
    end

    def image_height(path)
      image = Image.new(resolve_path path)
      Sass::Script::Number.new image.height, ['px']
    end

    def inline_image(path)
      image = Image.new(resolve_path path)
      data_uri = "data:#{image.content_type};base64,#{image.base64}"
      Sass::Script::String.new "url(#{data_uri})", :string
    end

    private

    def resolve_path(path)
      Sass::Images.path_resolver.call(path.value)
    end
  end
end

Sass::Script::Functions.send :include, Sass::Images::Functions
