class AddRegistrationIdToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :registration_id, :string
  end
end