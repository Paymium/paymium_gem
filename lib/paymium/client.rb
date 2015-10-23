require 'net/http'
require 'openssl'
require 'base64'

module Paymium

  #
  # Authenticated connection to the Paymium API
  #
  class Client

    attr_accessor :config

    #
    # Initialize a client
    #
    # @param config [Hash] Symbol-keyed hash of the configuration
    #
    def initialize(config = {})
      @config = config
      @host   = URI.parse @config.delete(:host) || Paymium::DEFAULT_HOST
    end

    #
    # Issue a GET request against the API
    #
    # @param path [String] The request path
    # @param params [Hash] The request parameters
    #
    def get(path, params = {}, &block)
      uri       = uri_from_path(path)
      uri.query = URI.encode_www_form params unless params.empty?
      request(Net::HTTP::Get.new(uri), &block)
    end

    #
    # Issue a POST request against the API
    #
    # @param path [String] The request path
    # @param params [Hash] The request parameters
    #
    def post(path, params = {}, &block)
      req       = Net::HTTP::Post.new(uri_from_path(path), {})
      req.body  = Oj.dump(params)
      request(req, &block)
    end

    #
    # Issue a DELETE request against the API
    #
    # @param path [String] The request path
    # @param params [Hash] The request parameters
    #
    def delete(path, params = {}, &block)
      uri       = uri_from_path(path)
      uri.query = URI.encode_www_form params unless params.empty?
      request(Net::HTTP::Delete.new(uri), &block)
    end

    private

    def set_header_fields(req)
      key = @config[:key]
      nonce = (Time.now.to_f * 10**6).to_i
      data = [nonce, req.uri.to_s, req.body].compact.join
      sig = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), @config[:secret], data).strip
      req.add_field "Api-Key", key
      req.add_field "Api-Nonce", nonce
      req.add_field "Api-Signature", sig
      req
    end

    def uri_from_path(path)
      uri       = @host.dup
      uri.path  = "#{@host.path}/#{path}".gsub('//','/')
      uri
    end

    def request(req, &block)
      req.content_type = 'application/json'
      set_header_fields(req) if @config[:key] and @config[:secret]
      Net::HTTP.start(@host.host, @host.port, :use_ssl => @host.scheme == 'https') do |http|
        resp = http.request(req)
        handle_response(resp, &block)
      end
    end

    def handle_response(resp, &block)
      if resp.class == Net::HTTPNoContent
        block.nil? ? nil : block.call(resp)
      elsif resp.class < Net::HTTPSuccess
        parsed_resp = Oj.load(resp.body)
        block.nil? ? parsed_resp : block.call(resp)
      else
        raise Error, resp.body
      end
    end

    # Generic Error class
    class Error < RuntimeError; end

  end
end
