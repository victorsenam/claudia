class AddEmailConfirmToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmation, :string
  end
end
