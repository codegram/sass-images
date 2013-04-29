require_relative '../../../spec_helper'

describe Sass::Images::ImageMeta do
  subject do
    Sass::Images::ImageMeta.new('spec/assets/ed.jpg')
  end

  describe "width" do
    it "returns a correct width" do
      expect(subject.width).to eq(228)
    end
  end

  describe "height" do
    it "returns a correct height" do
      expect(subject.height).to eq(218)
    end
  end
end
