require 'mime/types'
require 'base64'

module Sass::Images
  # The Image module exposes an easy API to inspect an image's properties.
  class Image
    # Initializes an Image
    #
    # path - The place on the filesystem where the image is located.
    def initialize(path)
      @path = path.to_s
    end

    # Returns an Integer with the image's with.
    def width
      metadata[:width]
    end

    # Returns an Integer with the image's height.
    def height
      metadata[:height]
    end

    # Returns a String with the base64-encoded version of the image.
    def base64
      Base64.encode64(File.read(@path)).gsub("\n", '')
    end

    # Returns a String with the image's content type.
    def content_type
      MIME::Types.type_for(@path)[0].content_type.force_encoding 'UTF-8'
    end

    private

    def metadata
      @metadata ||= MiniMagick::Image.open(@path)
    end
  end
end
