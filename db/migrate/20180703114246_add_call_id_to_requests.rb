class AddCallIdToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :call_id, :string
  end
end
