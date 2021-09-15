class AddCategoryToAnalysis < ActiveRecord::Migration[6.1]
  def change
    add_column :analyses, :category, :string
  end
end
