class RenameCategoryColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :category, :category_id
    rename_column :items, :status, :status_id
    rename_column :items, :shipping_charges, :shipping_charges_id
    rename_column :items, :ship_from_address, :address_id
    rename_column :items, :date_takes, :date_takes_id
  end
end
