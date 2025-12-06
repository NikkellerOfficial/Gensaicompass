class AddSpecialityToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :speciality, :string
  end
end
