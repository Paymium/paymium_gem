# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paymium/version'

Gem::Specification.new do |spec|
  spec.name          = 'paymium'
  spec.version       = Paymium::VERSION
  spec.authors       = ['Nicolas PAPON', 'David FRANCOIS']
  spec.email         = ['nicolas.papon@paymium.com', 'david.francois@paymium.com']
  spec.summary       = 'Paymium API client'
  spec.description   = 'Paymium API client'
  spec.homepage      = 'https://paymium.com'
  spec.license       = 'MIT'

  spec.add_dependency 'oj'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'

  spec.require_path = 'lib'
  spec.files        = Dir['{bin,lib}/**/*', 'LICENSE', 'README.md']

  spec.bindir      = 'bin'
  spec.executables << 'paymium'
end

