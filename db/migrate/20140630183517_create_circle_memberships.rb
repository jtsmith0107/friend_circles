class CreateCircleMemberships < ActiveRecord::Migration
  def change
    create_table :circle_memberships do |t|
      t.integer :friend_id
      t.integer :circle_id

      t.timestamps
    end
    add_index :circle_memberships, [:friend_id, :circle_id], unique: true
  end
end
