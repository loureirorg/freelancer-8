class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env["omniauth.auth"]
    # not found (looking for uid)
    if ! user = User.find_by(facebook_uid: auth.uid)
      # found by email: update the uid
      if user = User.find_by(email: auth.info.email)
        user.facebook_uid = auth.uid
        user.skip_confirmation!
        user.update_attributes({facebook_uid: auth.uid})
      else
        # not found, create a new one
        user = User.create! do |user|
          user.facebook_uid = auth.uid
          user.name = auth.info.name
          user.email = auth.info.email
          user.skip_confirmation!
        end
        # user.welcome_message if user.persisted?
      end
    end

    # valid user?
    if user.persisted?
      sign_in_and_redirect user
    else
      # not valid user, go to register screen
      user.valid?
      flash[:alert] = user.errors.full_messages.first unless user.try(:errors).nil?
      redirect_to new_user_registration_path
    end
  end
end
