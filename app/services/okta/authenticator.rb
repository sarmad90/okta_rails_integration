module Okta
  class Authenticator
    def authentication_url
      auth_client.authorization_uri.to_s
    end

    def receive_authorization_code(code)
      auth_client.code = code
      auth_client.fetch_access_token!

      # save access_token_object in DB
      OktaAuthentication.create!(
        account_name: "dev-207260",
        data: {
          auth_object: JSON.parse(auth_client.to_json),
        }
      )
    end

    def auth_client
      @auth_client ||= Signet::OAuth2::Client.new(
        authorization_uri: "https://dev-207260.okta.com/oauth2/v1/authorize",
        token_credential_uri: "https://dev-207260.okta.com/oauth2/v1/token",
        client_id: "0oaaksj7aDNjG19yZ4x6",
        client_secret: Rails.application.config.okta[:client_secret],
        response_type: "code",
        redirect_uri: "https://84d384d4.ngrok.io/oauth/okta_callback",
        state: "state-296bc9a0-a2a2-4a57-be1a-d0e2fd9bb601",
        grant_type: "authorization_code",
        scope: [
          "openid",
          "offline_access",
          "profile",
          "email",
          "address",
          "phone",
          "okta.users.read",
        ]
      )
    end
  end
end
