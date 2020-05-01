class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :lunches, :price, :decimal
  end
end
