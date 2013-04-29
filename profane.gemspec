# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'profane/version'

Gem::Specification.new do |spec|
  spec.name          = "profane"
  spec.version       = Profane::VERSION
  spec.authors       = ["Jonan Scheffler"]
  spec.email         = ["jonanscheffler@gmail.com"]
  spec.description   = %q{A simple, flexible profanity filter.}
  spec.summary       = %q{Profane is a basic profanity filter designed to filter and detect keywords based on an internal or external dictionary, or a combination of both.}
  spec.homepage      = "http://github.com/1337807/profane"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
