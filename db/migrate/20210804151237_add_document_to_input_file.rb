class AddDocumentToInputFile < ActiveRecord::Migration[6.1]
  def change
    add_reference :input_files, :document, null: false, foreign_key: true
  end
end
