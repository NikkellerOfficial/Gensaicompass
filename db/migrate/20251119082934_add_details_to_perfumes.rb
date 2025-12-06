class AddDetailsToPerfumes < ActiveRecord::Migration[7.2]
  def change
    add_column :perfumes, :question, :string
    add_reference :perfumes, :user, null: false, foreign_key: true
  end
end
