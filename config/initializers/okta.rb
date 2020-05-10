require 'signet/oauth_2/client'

Rails.application.configure do
  config.okta = {
    client_secret: Rails.application.credentials.okta[:client_secret],
  }
end