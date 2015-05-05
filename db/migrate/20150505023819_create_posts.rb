class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :message

      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
