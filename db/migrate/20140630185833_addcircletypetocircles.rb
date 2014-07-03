class Addcircletypetocircles < ActiveRecord::Migration
  def change
    add_column :circles, :circle_type, :string
    change_column :circles, :circle_type, :string, :null => false
  end
end
