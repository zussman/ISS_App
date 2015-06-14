class RemoveColumnFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :state
    remove_column :locations, :zip
  end
end
