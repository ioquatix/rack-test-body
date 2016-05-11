# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/test/json/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-test-json"
  spec.version       = Rack::Test::JSON::VERSION
  spec.authors       = ["Samuel Williams"]
  spec.email         = ["samuel.williams@oriontransfer.co.nz"]

  spec.summary       = %q{Add Rack::MockResponse#as_json to facilite testing.}
  spec.homepage      = "https://github.com/ioquatix/rack-test-json"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack-test"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
