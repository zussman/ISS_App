class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :location_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
