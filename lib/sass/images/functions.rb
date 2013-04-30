require 'mini_magick'
require 'sass'
require_relative 'image'

module Sass::Images
  # A set of functions that are exposed to the SASS language.
  module Functions
    # Exposes a `image-width($path)` function inside the SASS language.
    #
    # Example (in SASS language):
    #   .logo{
    #     height: image-width('logo.png');
    #   }
    #
    # Returns a Sass::Script::Number with the image's width in px.
    def image_width(path)
      image = Image.new(resolve_path path)
      Sass::Script::Number.new image.width, ['px']
    end

    # Exposes a `image-height($path)` function inside the SASS language.
    #
    # Example (in SASS language):
    #   .logo{
    #     height: image-height('logo.png');
    #   }
    #
    # Returns a Sass::Script::Number with the image's height in px.
    def image_height(path)
      image = Image.new(resolve_path path)
      Sass::Script::Number.new image.height, ['px']
    end

    # Exposes a `inline-image($path)` function inside the SASS language. It
    # serializes an image in Base64 following the Data URI scheme.
    #
    # Example (in SASS language):
    #   .logo{
    #     background-image: inline-image('logo.png');
    #   }
    #
    # Returns a Sass::Script::String literal of the serialized image.
    def inline_image(path)
      image = Image.new(resolve_path path)
      data_uri = "data:#{image.content_type};base64,#{image.base64}"
      Sass::Script::String.new "url(#{data_uri})"
    end

    private

    def resolve_path(path)
      Sass::Images.path_resolver.call(path.value)
    end
  end
end

Sass::Script::Functions.send :include, Sass::Images::Functions
