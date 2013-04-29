class Sass::Images::ImageMeta
  def initialize(path)
    @path = path
  end

  def width
    metadata[:width]
  end

  def height
    metadata[:height]
  end

  private

  def metadata
    @metadata ||= MiniMagick::Image.open(@path)
  end
end
