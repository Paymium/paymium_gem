# Paymium ruby client

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

