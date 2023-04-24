class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.string :delivery_address_name, null: false
      t.string :delivery_address_other, null: false
      t.string :delivery_address_zip_code, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
