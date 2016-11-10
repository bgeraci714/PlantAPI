class AddDescriptionToPlants < ActiveRecord::Migration[5.0]
  def change
    add_column :plants, :description, :string
  end
end
