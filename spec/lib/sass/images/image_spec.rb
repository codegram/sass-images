require_relative '../../../spec_helper'
require 'base64'

describe Sass::Images::Image do
  let(:path){ 'spec/assets/ed.jpg' }
  subject do
    Sass::Images::Image.new(path)
  end

  describe "#width" do
    it "returns a correct width" do
      expect(subject.width).to eq(228)
    end
  end

  describe "#height" do
    it "returns a correct height" do
      expect(subject.height).to eq(218)
    end
  end

  describe "#content_type" do
    it "returns a correct content type" do
      expect(subject.content_type).to eq('image/jpeg')
    end
  end

  describe "#base64" do
    it "returns a base64 encoded version of a file" do
      decoded = Base64.decode64(subject.base64).force_encoding 'UTF-8'
      original = File.read(path)

      expect(decoded).to eq(original)
    end
  end
end
