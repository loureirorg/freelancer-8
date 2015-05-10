class AddLinkedinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_uid, :string
    add_column :users, :linkedin_user_data, :text
    add_column :users, :linkedin_contacts_data, :text
    add_column :contacts, :linkedin_name, :string
    add_column :contacts, :linkedin_id, :string
    add_column :contacts, :linkedin_photo_link, :string
  end
end
