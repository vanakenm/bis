class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def record
    @request = Request.find(params[:request_id])
    @request.expert_answer = params[:SpeechResult]
    @request.save

    trello = TrelloApi.new
    trello.finish(@request.card_id, @request.expert_answer)
    head :ok
  end

  def voice
    @request_id = params[:request_id]
    @request = Request.find(@request_id)
  end
end
