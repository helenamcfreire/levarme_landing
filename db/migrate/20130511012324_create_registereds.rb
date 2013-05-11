class CreateRegistereds < ActiveRecord::Migration
  def change
    create_table :registereds do |t|

      t.string :email, :null => false, :default => ''
      t.timestamps
    end
  end
end
