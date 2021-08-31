class AddPreprocessDataToPreprocessing < ActiveRecord::Migration[6.1]
  def change
    remove_column :preprocessings, :preprocessed, :boolean
    add_column :preprocessings, :preprocessed_data, :jsonb
  end
end
