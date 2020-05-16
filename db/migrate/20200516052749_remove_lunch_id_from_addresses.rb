class RemoveLunchIdFromAddresses < ActiveRecord::Migration[6.0]
  def change

    remove_column :addresses, :lunch_id, :bigint
  end
end
