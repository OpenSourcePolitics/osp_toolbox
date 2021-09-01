class AddPreprocessedToPreprocessing < ActiveRecord::Migration[6.1]
  def change
    add_column :preprocessings, :preprocessed, :boolean
  end
end
