class AddColumnsToLunch < ActiveRecord::Migration[6.0]
  def change
    add_column :lunches, :street, :string
    add_column :lunches, :suburb, :string
    add_column :lunches, :state, :string
    add_column :lunches, :postcode, :string
  end
end
