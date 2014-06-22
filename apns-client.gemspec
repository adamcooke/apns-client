$:.push File.expand_path("../lib", __FILE__)

require "apns/version"

Gem::Specification.new do |s|
  s.name        = "apns-client"
  s.version     = APNS::VERSION
  s.authors     = ["Adam Cooke"]
  s.email       = ["me@adamcooke.io"]
  s.homepage    = "http://adamcooke.io"
  s.summary     = "A Ruby client for APNS Proxy."
  s.description = "A Ruby client library for communicating with the APNS Proxy server."
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.licenses    = ['MIT']
end
