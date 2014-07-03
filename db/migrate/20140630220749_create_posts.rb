class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.string :title, null: false
      t.integer :user_id, null: false
      
      t.timestamps
    end
    add_index :posts, :title, unique: true
    add_index :posts, [:user_id]
  end
end
