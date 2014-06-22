module APNS
  class Response
    
    def initialize(result)
      @result = result
    end
    
    def status_code
      @result.code.to_i
    end
    
    def success?
      status_code >= 200 && status_code <= 299
    end
    
    def validation_error?
      status_code == 422
    end
    
    def body
      if success? || validation_error?
        @body ||= JSON.parse(@result.body)
      else
        nil
      end
    end
    
  end
end
