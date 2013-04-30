require "sass/images/version"
require "sass/images/functions"

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
