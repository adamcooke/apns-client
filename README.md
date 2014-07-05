# Client for APNS Proxy

This is a Ruby client library for applications which wish to use the HTTP 
API provided by the [APNS Proxy](http://github.com/adamcooke/apns-proxy) 
application.

## Installation

As with most Rubygems, just add the apns-client gem to your Gemfile and run
bundle to install it.

```ruby
gem 'apns-client', '~> 1.0'
```

Once installed, you can simply require it using `require 'apns'`.

## Usage

Using the library is simple. In this example, be sure to replace the URL
and auth key with the correct information for your APNS proxy installation.

```ruby
# Create a client object
client = APNS::Client.new('https://apns.yourdomain.com', 'abc123abc123')

# Create a notification
notification = APNS::Notification.new
notification.alert_body = "Hello World!"
notification.sound = "notification.caf"
notification.badge = 10

# Send the notification to a device. 
response = client.notify(device_identifier, notification)
response.success?               # => Has the notification been added successfully?
response.device_unsubscribed?   # => Has the device been unsubscribed?

# Register a device
response = client.register(device_identifier, "Adam's iPhone 5")
response                        # => true or false 
```
