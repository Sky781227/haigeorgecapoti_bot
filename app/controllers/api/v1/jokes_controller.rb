class Api::V1::JokesController < ApplicationController
  respond_to :json
  
  def index
    jokes = Joke.all
    render json: jokes, root: false
  end
  
  def random
    joke = Joke.order("RANDOM()").limit(1)
    render json: joke
  end
end