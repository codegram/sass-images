# Sass::Images
[![Build Status](https://travis-ci.org/codegram/sass-images.png?branch=master)](https://travis-ci.org/codegram/sass-images)

## Installation

Add this line to your application's Gemfile:

    gem 'sass-images', github: 'codegram/sass-images'

And then execute:

    $ bundle

## Usage

This gem adds new sass helpers especially made to deal with image properties.

Right now it includes:

* `image-width($path)`: Returns the width (px) of an image
* `image-height($path)`: Returns the height (px) of an image
* `inline-image($path)`: Returns an inlined Data URI scheme of an image

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
