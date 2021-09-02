class AddPreprocessedAtToPreprocessing < ActiveRecord::Migration[6.1]
  def change
    add_column :preprocessings, :preprocessed_at, :datetime
  end
end
