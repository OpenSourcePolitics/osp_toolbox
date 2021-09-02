class CreateAnalyses < ActiveRecord::Migration[6.1]
  def change
    create_table :analyses do |t|
      t.string :typename
      t.references :processing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
