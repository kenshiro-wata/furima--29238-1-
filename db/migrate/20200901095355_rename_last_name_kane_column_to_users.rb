class RenameLastNameKaneColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_name_kane, :last_name_kana
    rename_column :users, :first_name_kane, :first_name_kana
  end
end
