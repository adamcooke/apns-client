module APNS
  class Notification
    
    attr_accessor :alert_body, :action_loc_key, :loc_key, :loc_args, :launch_image
    attr_accessor :badge
    attr_accessor :sound
    attr_accessor :content_available
    attr_accessor :custom_data
    
    def to_hash
      {
        :alert => {
          :body => self.alert_body,
          :action_loc_key => self.action_loc_key,
          :loc_key => self.loc_key,
          :loc_args => self.loc_args,
          :launch_image => self.launch_image
        },
        :badge => self.badge,
        :sound => self.sound,
        :content_available => self.content_available,
        :custom_data => self.custom_data
      }
    end
    
  end
end
