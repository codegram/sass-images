require "sass/images/version"
require "sass/images/helpers"
require "sass/script/functions"

module Sass
  module Images
    def self.path_resolver=(resolver)
      @path_resolver = resolver
    end

    def self.path_resolver
      @path_resolver || lambda{ |path| path }
    end
  end
end

require "sass/images/railtie"
Sass::Script::Functions.send :include, Sass::Images::Helpers
