class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.integer :item_id
      t.string :name
      t.string :image
      t.text :about
      t.string :category
      t.integer :number_person

      t.timestamps
    end
  end
end
