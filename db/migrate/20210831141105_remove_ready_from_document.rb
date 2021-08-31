class RemoveReadyFromDocument < ActiveRecord::Migration[6.1]
  def change
    remove_column :documents, :ready
  end
end
