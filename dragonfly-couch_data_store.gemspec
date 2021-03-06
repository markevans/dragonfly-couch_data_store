# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly/couch_data_store/version'

Gem::Specification.new do |spec|
  spec.name          = "dragonfly-couch_data_store"
  spec.version       = Dragonfly::CouchDataStore::VERSION
  spec.authors       = ["Mark Evans"]
  spec.email         = ["mark@new-bamboo.co.uk"]
  spec.description   = %q{Couch data store for Dragonfly}
  spec.summary       = %q{Data store for storing content (e.g. images) handled with the Dragonfly gem in a couch database}
  spec.homepage      = "https://github.com/markevans/dragonfly-couch_data_store"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dragonfly", "~> 1.0"
  spec.add_runtime_dependency "couchrest"
  spec.add_development_dependency "rspec", "~> 2.0"
end

