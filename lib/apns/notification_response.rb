module APNS
  class NotificationResponse
    
    def initialize(response)
      @response = response
    end
    
    def success?
      @response.success?
    end
    
    def device_unsubscribed?
      @response.validation_error? &&
      @response.body['errors'] &&
      @response.body['errors']['device'] &&
      @response.body['errors']['device'].include?('unsubscribed')
    end
    
  end
end
