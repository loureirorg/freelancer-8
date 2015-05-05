class ChangeUidTypeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :facebook_uid, :integer
    add_column :users, :facebook_uid, :string
  end
end
