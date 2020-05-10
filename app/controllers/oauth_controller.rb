class OauthController < ApplicationController
  def okta_callback
    okta_authenticator.receive_authorization_code(params[:code])
  end

  def authenticate_okta
    redirect_to okta_authenticator.authentication_url
  end

  private

  def okta_authenticator
    @okta_authenticator ||= Okta::Authenticator.new
  end
end
