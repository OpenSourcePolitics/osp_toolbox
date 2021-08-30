class CreateArchives < ActiveRecord::Migration[6.1]
  def change
    create_table :archives do |t|
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
