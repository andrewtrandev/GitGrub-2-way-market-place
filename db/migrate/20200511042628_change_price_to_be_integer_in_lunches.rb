class ChangePriceToBeIntegerInLunches < ActiveRecord::Migration[6.0]
  def change
    change_column :lunches, :price, :integer
  end
end
