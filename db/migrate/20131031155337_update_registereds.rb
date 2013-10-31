class UpdateRegistereds < ActiveRecord::Migration
  def up
    add_column :registereds, :location, :string
  end

  def down
    remove_column :registereds, :location, :string
  end
end
