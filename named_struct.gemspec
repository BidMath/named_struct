# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'named_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "named_struct"
  spec.version       = NamedStruct::VERSION
  spec.authors       = ["Max Shytikov"]
  spec.email         = ["mshytikov@gmail.com"]
  spec.summary       = %q{Simple Struct with required keyword arguments}
  spec.description   = %q{Simple Struct with required keyword arguments}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-gem-adapter'
end
