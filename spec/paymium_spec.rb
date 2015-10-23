require_relative './spec_helper'

RSpec.describe Paymium do

  it 'should require Paymium::Client' do
    expect(Paymium.const_defined?(:Client)).to be(true)
  end

end
