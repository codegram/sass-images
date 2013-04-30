require 'mini_magick'
require 'sass'
require_relative 'image_meta'

module Sass::Images
  module Functions
    def image_width(path)
      width = ImageMeta.new(resolve_path path).width
      Sass::Script::Number.new width, ['px']
    end

    def image_height(path)
      height = ImageMeta.new(resolve_path path).height
      Sass::Script::Number.new height, ['px']
    end

    private

    def resolve_path(path)
      Sass::Images.path_resolver.call(path.value)
    end
  end
end

Sass::Script::Functions.send :include, Sass::Images::Functions
