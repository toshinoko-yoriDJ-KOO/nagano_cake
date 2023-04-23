class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.boolean :is_active, default: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
