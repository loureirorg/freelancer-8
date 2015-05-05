class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :facebook_name
      t.string :facebook_photo_link
      t.string :facebook_id

      t.timestamps null: false
    end
    add_index :contacts, :user_id
    add_index :contacts, [:user_id, :facebook_name]
  end
end
