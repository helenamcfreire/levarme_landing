class CreatePessoaChats < ActiveRecord::Migration
  def up
    create_table :pessoa_chats, :id => true do |t|
      t.string :participante_1_id
      t.string :participante_2_id
      t.string :evento_id
      t.integer :chat_id
    end
  end

  def down
    drop_table :pessoa_chats
  end
end