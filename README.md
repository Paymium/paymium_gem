# Paymium ruby client [![Build Status](https://secure.travis-ci.org/Paymium/paymium_gem.png?branch=master)](http://travis-ci.org/Paymium/paymium_gem) [![Coverage Status](https://img.shields.io/coveralls/Paymium/paymium_gem.svg)](https://coveralls.io/r/Paymium/paymium_gem?branch=master) [![Gem Version](https://badge.fury.io/rb/paymium_gem.svg)](http://badge.fury.io/rb/paymium_gem)

Simple ruby wrapper for the [Paymium API](https://github.com/Paymium/api-documentation).

## Usage

```ruby
paymium = Paymium::Api::Client.new({
  host:	  'https://paymium.com/api/v1',
  key:	  '<api token>',
  secret: '<api secret>'
})

paymium.get('/data/EUR/ticker')

paymium.get('/user')
````

