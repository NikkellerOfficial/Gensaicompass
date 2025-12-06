class AddUnitToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :unit, :string
  end
end
