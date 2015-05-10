class ImportersController < ApplicationController
  def gmail
    contacts = request.env['omnicontacts.contacts']
    user = request.env['omnicontacts.user']
    
    # save user data
    current_user.update_attributes(google_uid: user[:id], google_user_data: user.to_json, google_contacts_data: contacts.to_json)

    # import contacts
    contacts.each do |contact|
      contact[:name].strip!
      # old format doesn't work anymore
      contact[:profile_picture] = nil if /https\:\/\/profiles.google.com\/s2\/photos/.match(contact[:profile_picture]).present?
      db_contact = current_user.contacts.find_by(name: contact[:name]) || Contact.new(user: current_user)
      db_contact.name ||= contact[:name]
      db_contact.email ||= contact[:email]
      db_contact.photo_link ||= contact[:profile_picture]
      db_contact.google_name = contact[:name]
      db_contact.google_id = contact[:id]
      db_contact.google_photo_link = contact[:profile_picture]
      db_contact.save
    end

    # redirects to "user edit"
    redirect_to edit_user_registration_path
  end

  def hotmail
    contacts = request.env['omnicontacts.contacts']
    user = request.env['omnicontacts.user']

    # save user data
    current_user.update_attributes(hotmail_uid: user[:id], hotmail_user_data: user.to_json, hotmail_contacts_data: contacts.to_json)

    # import contacts
    contacts.each do |contact|
      contact[:name].strip!
      db_contact = current_user.contacts.find_by(name: contact[:name]) || Contact.new(user: current_user)
      db_contact.name ||= contact[:name]
      db_contact.email ||= contact[:email]
      db_contact.photo_link ||= contact[:profile_picture]
      db_contact.hotmail_name = contact[:name]
      db_contact.hotmail_id = contact[:id]
      db_contact.hotmail_photo_link = contact[:profile_picture]
      db_contact.save
    end

    # redirects to "user edit"
    redirect_to edit_user_registration_path
  end

  def yahoo
    contacts = request.env['omnicontacts.contacts']
    user = request.env['omnicontacts.user']

    # save user data
    current_user.update_attributes(yahoo_uid: user[:id], yahoo_user_data: user.to_json, yahoo_contacts_data: contacts.to_json)

    # import contacts
    contacts.each do |contact|
      contact[:name].strip!
      db_contact = current_user.contacts.find_by(name: contact[:name]) || Contact.new(user: current_user)
      db_contact.name ||= contact[:name]
      db_contact.email ||= contact[:email]
      db_contact.photo_link ||= contact[:profile_picture]
      db_contact.yahoo_name = contact[:name]
      db_contact.yahoo_id = contact[:id]
      db_contact.yahoo_photo_link = contact[:profile_picture]
      db_contact.save
    end

    # redirects to "user edit"
    redirect_to edit_user_registration_path
  end

  def linkedin
    contacts = request.env['omnicontacts.contacts']
    user = request.env['omnicontacts.user']

    # save user data
    # *** "user" is always nil here in LINKEDIN ***
    current_user.update_attributes(linkedin_uid: "1", linkedin_user_data: {}.to_json, linkedin_contacts_data: contacts.to_json)

    # import contacts
    contacts.each do |contact|
      contact[:name].strip!
      db_contact = current_user.contacts.find_by(name: contact[:name]) || Contact.new(user: current_user)
      db_contact.name ||= contact[:name]
      db_contact.photo_link ||= contact[:profile_picture]
      db_contact.linkedin_name = contact[:name]
      db_contact.linkedin_id = contact[:id]
      db_contact.linkedin_photo_link = contact[:profile_picture]
      db_contact.save
    end

    # redirects to "user edit"
    redirect_to edit_user_registration_path
  end
end
