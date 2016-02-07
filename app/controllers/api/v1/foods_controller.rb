class Api::V1::FoodsController < ApplicationController
  respond_to :json

  def index
    foods = Food.all
    render json: foods, root: false
  end

  def random
    food = Food.order("RANDOM()").limit(1)
    render json: food
  end
end
