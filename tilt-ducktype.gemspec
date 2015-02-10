# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tilt/ducktype/version'

Gem::Specification.new do |spec|
  spec.name          = "tilt-ducktype"
  spec.version       = Tilt::Ducktype::VERSION
  spec.authors       = ["Garrett LeSage"]
  spec.email         = ["garrett@redhat.com"]
  spec.summary       = %q{Mallard Ducktype support for Tilt}
  spec.description   = %q{Quick and hacky way to support Mallard Ducktype with Tilt.}
  #spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'tilt'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
