class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, except: [:disconnect_facebook, :disconnect_google]
  before_action :redirect_frontpage
  before_action :initialize_omniauth_state

  def disconnect_facebook
    result = false
    if user_signed_in?
      current_user.update_attributes(facebook_uid: nil)
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def disconnect_google
    result = false
    if user_signed_in?
      current_user.update_attributes(google_uid: nil)
      redirect_to edit_user_registration_path(current_user)
    end
  end

  private

  def redirect_frontpage
    if user_signed_in? && action_name == "frontpage"
      redirect_to contacts_path
    end
  end

  def initialize_omniauth_state
    session['omniauth.state'] = response.headers['X-CSRF-Token'] = form_authenticity_token
  end

end
