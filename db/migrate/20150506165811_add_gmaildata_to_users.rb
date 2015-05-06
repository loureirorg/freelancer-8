class AddGmaildataToUsers < ActiveRecord::Migration
  def change
    add_column :contacts, :google_name, :text
    add_column :contacts, :google_photo_link, :text
    add_column :contacts, :google_id, :text
    add_column :users, :google_user_data, :text
    add_column :users, :google_contacts_data, :text
  end
end
