class CreateInputFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :input_files do |t|
      t.string :type

      t.timestamps
    end
  end
end
