class RemovePreprocessedDataFromProcessing < ActiveRecord::Migration[6.1]
  def change
    remove_column :processings, :preprocessed_data
  end
end
