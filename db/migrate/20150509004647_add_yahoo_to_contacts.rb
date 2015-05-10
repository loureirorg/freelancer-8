class AddYahooToContacts < ActiveRecord::Migration
  def change
    add_column :users, :yahoo_uid, :string
    add_column :users, :yahoo_user_data, :text
    add_column :users, :yahoo_contacts_data, :text
    add_column :contacts, :yahoo_name, :string
    add_column :contacts, :yahoo_id, :string
    add_column :contacts, :yahoo_photo_link, :string
  end
end
