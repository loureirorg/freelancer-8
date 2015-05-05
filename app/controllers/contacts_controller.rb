class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts.order(:facebook_name)
  end
end
