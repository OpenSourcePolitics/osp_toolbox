class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :event_name
      t.string :resource_class
      t.integer :resource_id
      t.integer :target_id

      t.timestamps
    end
  end
end
