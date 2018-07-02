require 'trello'

class TrelloApi
  def initialize
    Trello.configure do |config|
      config.developer_public_key = ENV['trello_key'] # The "key" from step 1
      config.member_token = ENV['trello_token'] # The token from step 2.
    end
  end
  
  def board(id)
    Trello::Board.find(id)
  end

  def create_request_card(name, description)
    Trello::Card.create(name: name, description: description, board_id: "96U4Kigb", list_id: "5b3a7a4972ee34864fd37c97")
  end
end