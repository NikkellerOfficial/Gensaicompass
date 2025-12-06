class AddPhaseToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :phase, :integer
  end
end
