class RenameInputFileColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :input_files, :type, :typename
  end
end
