require 'oj'

Oj.default_options = {
  bigdecimal_load:        true,
  bigdecimal_as_decimal:  true,
  mode:                   :compat
}

require 'paymium/client'
require 'paymium/version'

#
# Root module
#
module Paymium

  # Default API host
  DEFAULT_HOST = 'https://paymium.com/api/v1'

end

