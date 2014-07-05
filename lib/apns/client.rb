require 'uri'
require 'net/https'
require 'json'

module APNS
  class Client
    
    attr_reader :uri, :auth_token
    
    def initialize(uri, auth_key)
      @uri = URI.parse(uri)
      @auth_key = auth_key
    end
    
    #
    # Send a notification to a device
    #
    def notify(device, notification)
      response = make_request(:notify, {:device => device, :notification => notification.to_hash})
      NotificationResponse.new(response)
    end
    
    #
    # Register a device
    #
    def register(device, label = nil)
      response = make_request(:register, {:device => device, :label => label})
      response.success?
    end
    
    private
    
    #
    # Make an HTTP request
    def make_request(method, payload = {})
      request = Net::HTTP::Post.new("/api/#{method}")
      request.body = payload.merge({:auth_key => @auth_key}).to_json
      request.add_field 'User-Agent', "APNS Ruby Client Library/#{APNS::VERSION}"
      connection = Net::HTTP.new(@uri.host, @uri.port)
      if @uri.is_a?(URI::HTTPS)
        connection.use_ssl = true
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = connection.request(request)
      Response.new(result)
    end
    
  end
end
