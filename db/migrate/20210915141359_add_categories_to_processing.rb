class AddCategoriesToProcessing < ActiveRecord::Migration[6.1]
  def change
    add_column :processings, :available_categories, :string
  end
end
