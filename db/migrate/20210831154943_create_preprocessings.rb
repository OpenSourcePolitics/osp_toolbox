class CreatePreprocessings < ActiveRecord::Migration[6.1]
  def change
    create_table :preprocessings do |t|
      t.string :title
      t.string :client
      t.string :url

      t.timestamps
    end
  end
end
