class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|

      t.string :uid, :null => false, :default => ''
      t.string :nome, :null => false, :default => ''
      t.timestamps
    end
  end
end
