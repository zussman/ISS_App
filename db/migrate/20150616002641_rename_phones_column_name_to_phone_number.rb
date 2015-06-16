class RenamePhonesColumnNameToPhoneNumber < ActiveRecord::Migration
  def change
    rename_column :phones, :number, :phone_number
  end
end
