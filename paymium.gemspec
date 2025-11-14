# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paymium/version'

Gem::Specification.new do |spec|
  spec.name          = 'paymium_api'
  spec.version       = Paymium::VERSION
  spec.authors       = ['Paymium Tech']
  spec.email         = ['tech@paymium.com']
  spec.summary       = 'Paymium API client'
  spec.description   = 'The client handles authentication and enables users to directly issue requests to the Paymium API'
  spec.homepage      = 'https://paymium.com'
  spec.license       = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new(">= 3.2.0")

  spec.add_dependency 'oj'

  spec.add_development_dependency 'rake',       '~> 0'
  spec.add_development_dependency 'rspec',      '~> 3'
  spec.add_development_dependency 'simplecov',  '~> 0.16.1'
  spec.add_development_dependency 'yard',       '~> 0.9.20'
  spec.add_development_dependency 'coveralls',  '~> 0.8.23'
  spec.add_development_dependency 'vcr',        '~> 6.3.1'
  spec.add_development_dependency 'webmock',    '~> 3'

  spec.require_path = 'lib'
  spec.files        = Dir['{bin,lib}/**/*', 'LICENSE', 'README.md']

  spec.bindir      = 'bin'
  spec.executables << 'paymium'
end
