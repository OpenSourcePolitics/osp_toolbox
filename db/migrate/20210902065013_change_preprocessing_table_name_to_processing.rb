class ChangePreprocessingTableNameToProcessing < ActiveRecord::Migration[6.1]
  def change
    rename_table :preprocessings, :processings
  end
end
