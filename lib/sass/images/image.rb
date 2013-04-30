require 'mime/types'
require 'base64'

class Sass::Images::Image
  def initialize(path)
    @path = path
  end

  def width
    metadata[:width]
  end

  def height
    metadata[:height]
  end

  def base64
    Base64.encode64(File.read(@path)).gsub("\n", '')
  end

  def content_type
    MIME::Types.type_for(@path)[0].content_type.force_encoding 'UTF-8'
  end

  private

  def metadata
    @metadata ||= MiniMagick::Image.open(@path)
  end
end
