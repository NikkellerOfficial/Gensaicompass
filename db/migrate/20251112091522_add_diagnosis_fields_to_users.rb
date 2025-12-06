class AddDiagnosisFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :male_count, :integer, default: 0, null: false
    add_column :users, :female_count, :integer, default: 0, null: false
    add_column :users, :infant_count, :integer, default: 0, null: false
    add_column :users, :elderly_count, :integer, default: 0, null: false
    add_column :users, :disability_count, :integer, default: 0, null: false
    add_column :users, :pet_count, :integer, default: 0, null: false
    add_column :users, :diag_completed, :boolean, default: false, null: false
  end
end
