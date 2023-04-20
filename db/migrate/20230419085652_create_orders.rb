class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :total_payment, null: false
      t.integer :shopping_cost, null: false
      t.integer :postal_code, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
