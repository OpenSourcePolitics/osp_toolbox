class AddUserReferencesToProcessing < ActiveRecord::Migration[6.1]
  def up
    add_reference :processings, :user, foreign_key: true

    Processing.where(user_id: nil).each{|p| p.update!(user: User.first)}

    change_column :processings, :user_id, :integer, null: false
  end

  def down
    remove_column :processings, :user_id
  end
end
