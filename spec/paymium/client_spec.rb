require_relative '../spec_helper'

RSpec.describe 'Paymium::Client' do

  let(:client) { Paymium::Client.new }

  it 'should be initialized' do
    expect(client).to be_an_instance_of(Paymium::Client)
  end

  it 'should issue a GET request properly' do
    VCR.use_cassette('GET_ticker') do
      expect(client.get('/data/eur/ticker')).to be_an_instance_of(Hash)
    end
  end

  context 'when authenticated' do
    before do
      client.config[:key]     = 'FAKE-KEY'
      client.config[:secret]  = 'FAKE-SECRET'
    end

    it 'should issue a POST properly' do
      VCR.use_cassette('POST_price_alert') do
        http_status = nil
        client.post('/user/price_alerts', { notify_above: 10, notify_below: 5, token: 'hello token!' }) do |resp|
          http_status = resp.code
        end
        expect(http_status).to eq('201')
      end
    end

    it 'should issue a DELETE properly' do
      VCR.use_cassette('DELETE_price_alert') do
        http_status = nil
        client.delete('/user/price_alerts/1') { |resp| http_status = resp.code }
        expect(http_status).to eq('204')
      end
    end

    it 'should raise an exception when attemting an incorrect POST' do
      VCR.use_cassette('POST_incorrect_price_alert') do
        expect { client.post('/user/price_alerts', {}) }.to raise_error(Paymium::Client::Error)
      end
    end
  end
end
