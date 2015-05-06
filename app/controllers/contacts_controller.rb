class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts.order(:name)
  end
end
