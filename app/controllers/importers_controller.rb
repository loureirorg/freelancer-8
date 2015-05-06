class ImportersController < ApplicationController
  def gmail
    contacts = request.env['omnicontacts.contacts']
    user = request.env['omnicontacts.user']
    
    # save user data
    current_user.update_attributes(email: user[:email], google_uid: user[:id], google_user_data: user.to_json, google_contacts_data: contacts.to_json)

    # import contacts
    contacts.each do |contact|
      # old format doesn't work anymore
      contact[:profile_picture] = nil if /https\:\/\/profiles.google.com\/s2\/photos/.match(contact[:profile_picture]).present?

      db_contact = current_user.contacts.find_by(name: contact[:name]) || Contact.new(user: current_user)
      db_contact.name ||= contact[:name]
      db_contact.photo_link ||= contact[:profile_picture]
      db_contact.google_name = contact[:name]
      db_contact.google_id = contact[:id]
      db_contact.google_photo_link = contact[:profile_picture]
      db_contact.save
    end

    # redirects to "user edit"
    redirect_to edit_user_registration_path
  end
end
