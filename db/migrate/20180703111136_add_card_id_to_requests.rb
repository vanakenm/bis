class AddCardIdToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :card_id, :string
  end
end
