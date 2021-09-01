class AddSendToPreprocessingToPreprocessing < ActiveRecord::Migration[6.1]
  def change
    add_column :preprocessings, :sent_to_preprocessing_at, :datetime
  end
end
