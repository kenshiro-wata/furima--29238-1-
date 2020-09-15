class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code ,null: false
      t.integer :prefecture ,null: false
      t.string :address_city ,null: false
      t.string :block_number ,null: false
      t.string :building_number ,null: false
      t.string :phone_number ,null: false
      t.references :manage, foreign_key: true
      t.timestamps
    end
  end
end
