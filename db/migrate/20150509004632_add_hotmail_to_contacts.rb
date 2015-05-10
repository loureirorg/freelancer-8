class AddHotmailToContacts < ActiveRecord::Migration
  def change
    add_column :users, :hotmail_uid, :string
    add_column :users, :hotmail_user_data, :text
    add_column :users, :hotmail_contacts_data, :text
    add_column :contacts, :hotmail_name, :string
    add_column :contacts, :hotmail_id, :string
    add_column :contacts, :hotmail_photo_link, :string
  end
end
