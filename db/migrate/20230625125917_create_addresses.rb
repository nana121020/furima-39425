class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :post_number, null: false
      t.integer :area, null: false
      t.string :city_name, null: false
      t.string :banchi, null: false
      t.string :build_name
      t.string :phone_number, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
