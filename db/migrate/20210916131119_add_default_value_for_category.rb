class AddDefaultValueForCategory < ActiveRecord::Migration[6.1]
  def up
    change_column :analyses, :category, :string, default: ""

    Analysis.where(category: nil).each { |a| a.update!(category: "") }
  end

  def down
    change_column :analyses, :category, :string
  end
end
