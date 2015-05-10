class AddTwitterToContacts < ActiveRecord::Migration
  def change
    add_column :users, :twitter_uid, :string
    add_column :users, :twitter_user_data, :text
    add_column :users, :twitter_contacts_data, :text
    add_column :contacts, :twitter_name, :string
    add_column :contacts, :twitter_id, :string
    add_column :contacts, :twitter_photo_link, :string
  end
end
