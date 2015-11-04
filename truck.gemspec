# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'truck/version'

Gem::Specification.new do |spec|
  spec.name          = "truck_you"
  spec.version       = Truck::Version
  spec.authors       = ["Dave De Carlo, Bryan Mulvihill"]
  spec.email         = ["dec114@gmail.com, mulvihill.bryan@gmail.com"]
  spec.summary       = %q{A Ruby interface to google analytics}
  spec.homepage      = "https://github.com/quotha/truck"
  spec.description   = "Keep truckin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
end
