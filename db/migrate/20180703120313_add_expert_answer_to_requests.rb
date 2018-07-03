class AddExpertAnswerToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :expert_answer, :string
  end
end
