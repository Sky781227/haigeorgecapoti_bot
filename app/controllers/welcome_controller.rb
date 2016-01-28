class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  @@is_alive = false
  # GET /welcome
  def index

  end

  def start_bot
    if !@@is_alive
      Bot.start
      render json: {status: 200}
      @@is_alive = true
    else
      render json: {status: "already started"}
    end
  end
end
