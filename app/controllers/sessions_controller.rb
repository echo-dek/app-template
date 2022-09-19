class SessionsController < ApplicationController
  def new
    render action: "new"
  end

  def create
    auth_data = request.env["omniauth.auth"]
    user = find_from(auth_data) || create_from(auth_data)
    raise AuthenticationFailed if user.nil?
    redirect_to home_path
  end

  class AuthenticationFailed < Exception
  end

  protected

  def find_from(auth_data)
    finder = Rails.application.config.omniauth_find_user
    finder.nil ? Omniauth::Provider.find_from(auth_data) : finder.call(auth_data)
  end

  def create_from(auth_data)
    creator = Rails.application.config.omniauth_create_user
    creator.nil? ? nil : creator.call(auth_data)
  end
end
