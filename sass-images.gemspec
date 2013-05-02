# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sass/images/version'

Gem::Specification.new do |spec|
  spec.name          = "sass-images"
  spec.version       = Sass::Images::VERSION
  spec.authors       = ["Josep Jaume Rey Peroy"]
  spec.email         = ["josepjaume@gmail.com"]
  spec.description   = %q{A sass helper that knows how to deal with images}
  spec.summary       = %q{A sass helper that knows how to deal with images}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "sass"
  spec.add_runtime_dependency "mini_magick", '>= 3.5.0'
  spec.add_runtime_dependency "mime-types"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
