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
  spec.description   = 'The client handles authentication and enables users to directly issue requests to the Paymium API'
  spec.homepage      = 'https://paymium.com'
  spec.license       = 'MIT'

  spec.add_dependency 'oj', '~> 2'

  spec.add_development_dependency 'rake',       '~> 0'
  spec.add_development_dependency 'rspec',      '~> 3'
  spec.add_development_dependency 'simplecov',  '~> 0.10.0'
  spec.add_development_dependency 'yard',       '~> 0.9.20'
  spec.add_development_dependency 'coveralls',  '~> 0.7'
  spec.add_development_dependency 'vcr',        '~> 2.9'
  spec.add_development_dependency 'webmock',    '~> 1.0'

  spec.require_path = 'lib'
  spec.files        = Dir['{bin,lib}/**/*', 'LICENSE', 'README.md']

  spec.bindir      = 'bin'
  spec.executables << 'paymium'
end
