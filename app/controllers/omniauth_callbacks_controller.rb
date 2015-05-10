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
      # updates the contacts list
      @graph = Koala::Facebook::API.new(auth[:credentials][:token], ENV['FACEBOOK_SECRET'])
      contacts = @graph.get_connections("me", "invitable_friends")
      contacts.each do |contact|
        db_contact = user.contacts.find_by(name: contact["name"]) || Contact.new(user: user)
        db_contact.name = contact["name"]
        db_contact.photo_link = contact["picture"]["data"]["url"]
        db_contact.facebook_name = contact["name"]
        db_contact.facebook_id = contact["id"]
        db_contact.facebook_photo_link = contact["picture"]["data"]["url"]
        db_contact.save
      end

      # redirects to home
      sign_in_and_redirect user
    else
      # not valid user, go to register screen
      user.valid?
      flash[:alert] = user.errors.full_messages.first unless user.try(:errors).nil?
      redirect_to new_user_registration_path
    end
  end


  def twitter
    auth = request.env["omniauth.auth"]

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CLIENT_ID"] 
      config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token        = ENV["TWITTER_TOKEN_ID"]
      config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
    end

    # save user data
    current_user.update_attributes(twitter_uid: auth.uid, twitter_user_data: auth.to_json)

    # import contacts
    client.friends.each do |contact|
      db_contact = current_user.contacts.find_by(name: contact.name.strip) || Contact.new(user: current_user)
      db_contact.name ||= contact.name.strip
      db_contact.photo_link ||= contact.profile_image_url.to_s
      db_contact.twitter_name = contact.name.strip
      db_contact.twitter_id = contact.id
      db_contact.twitter_photo_link = contact.profile_image_url.to_s
      db_contact.twitter_profile_link = contact.url.to_s
      db_contact.save
    end

    # redirects to "user edit"
    redirect_to edit_user_registration_path
  end

end
