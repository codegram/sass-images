require "sass/images/version"
require "sass/images/functions"

module Sass
  # This module adds convenience functions to sass meant to deal with images,
  # being the most useful use cases returning their dimensions or serializing
  # them.
  module Images
    # Allows a new path resolver to be defined.
    #
    # Path resolver is a lambda that will be used to resolve where a particular
    # asset is in the filesystem. Its default behavior is to return the
    # path itself, but you can use another lambda to override that behavior.
    #
    # The canonical example is Rails' assets, that can be found in different
    # places on the project's filesystem.
    #
    # resolver - A lambda that returns a resolved path given a path
    def self.path_resolver=(resolver)
      @path_resolver = resolver
    end

    # Returns the current path resolver.
    def self.path_resolver
      @path_resolver || lambda{ |path| path }
    end
  end
end

require "sass/images/railtie"
