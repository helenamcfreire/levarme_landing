class CreatePessoaChats < ActiveRecord::Migration
  def up
    create_table :pessoa_chats, :id => false do |t|
      t.string :pessoa_id
      t.string :chat_id
    end
  end

  def down
    drop_table :pessoa_chats
  end
end