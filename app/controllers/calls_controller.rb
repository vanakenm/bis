class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def record
    byebug
  end

  def voice
  end
end
