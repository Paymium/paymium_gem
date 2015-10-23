require_relative '../spec_helper'

RSpec.describe Paymium::Client do

  before do
    @c = Paymium::Client.new
  end

  it 'should be initialized' do
    expect(@c).to be_an_instance_of(Paymium::Client)
  end

  it 'should issue a GET request properly' do
    VCR.use_cassette('GET_ticker') do
      expect(@c.get('/data/eur/ticker')).to be_an_instance_of(Hash)
    end
  end

  context 'when authenticated' do
    before do
      @c.config[:key]     = '48e96b524542df67f8f475ec43903eaa828db00f67036fa83dd42328a41c9615'
      @c.config[:secret]  = 'efe6b09f82d04b464bef4077b1c2aa79136425a7d2d3dc58a3677eff601984f8'
    end

    it 'should issue a POST properly' do
      VCR.use_cassette('POST_price_alert') do
        http_status = nil
        @c.post('/user/price_alerts', { notify_above: 10, notify_below: 5, token: 'hello token!' }) do |resp|
          http_status = resp.code
        end
        expect(http_status).to eq('201')
      end
    end

    it 'should issue a DELETE properly' do
      VCR.use_cassette('DELETE_price_alert') do
        http_status = nil
        @c.delete('/user/price_alerts/4') { |resp| http_status = resp.code }
        expect(http_status).to eq('204')
      end
    end

    it 'should raise an exception when attemting an incorrect POST' do
      VCR.use_cassette('POST_incorrect_price_alert') do
        expect { @c.post('/user/price_alerts', {}) }.to raise_error(Paymium::Client::Error)
      end
    end
  end
end

