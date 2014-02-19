# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appetizer/ui/react/version'

Gem::Specification.new do |spec|
  spec.name          = "appetizer-ui-react"
  spec.version       = Appetizer::UI::React::VERSION
  spec.authors       = ["Alex Hemard"]
  spec.email         = ["alexhemard@gmail.com"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "appetizer-ui"
  spec.add_dependency "execjs"
  spec.add_dependency "react-source", '0.8.0'
end
