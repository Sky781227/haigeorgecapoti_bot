class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  
  # GET /welcome
  def index

  end
end
