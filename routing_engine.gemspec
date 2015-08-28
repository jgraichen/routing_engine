# coding: utf-8
require File.expand_path('../lib/routing_engine/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'routing_engine'
  spec.version       = RoutingEngine::VERSION
  spec.authors       = ['Jan Graichen']
  spec.email         = ['jg@altimos.de']

  spec.summary       = 'Flexible low-level Rack Routing Engine'
  spec.description   = 'Flexible low-level Rack Routing Engine'
  spec.homepage      = 'https://github.com/jgraichen/routing_engine'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
    .split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rack'
  spec.add_dependency 'mustermann'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack-test'
end
