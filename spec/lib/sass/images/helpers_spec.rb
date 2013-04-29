require_relative '../../../spec_helper'

describe Sass::Images::Helpers do
  subject do
    klass = Class.new do
      include Sass::Images::Helpers
    end
    klass.new
  end

  let(:image) do
    Sass::Script::String.new "spec/assets/ed.jpg", :string
  end

  describe "image_width" do
    it "returns a correct width" do
      width = subject.image_width(image)
      expect(width.to_s).to eq('228px')
    end
  end

  describe "image_height" do
    it "returns a correct height" do
      height = subject.image_height(image)
      expect(height.to_s).to eq('218px')
    end
  end
end
