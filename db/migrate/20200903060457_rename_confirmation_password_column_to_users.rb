class RenameConfirmationPasswordColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :confirmation_password, :password_confirmation
  end
end
