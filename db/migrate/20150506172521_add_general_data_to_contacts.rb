class AddGeneralDataToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :name, :string
    add_column :contacts, :photo_link, :string

    add_index :contacts, :name

    # convert old data
    Contact.all.each do |contact|
      contact.update_attributes(name: contact.facebook_name, photo_link: contact.facebook_photo_link)
    end
  end

  def down
    remove_column :contacts, :name, :string
    remove_column :contacts, :photo_link, :string
  end
end
