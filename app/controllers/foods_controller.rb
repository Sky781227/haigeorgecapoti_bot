class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = "Sounds delicious! Food saved."
      redirect_to foods_path
    else
      flash[:error] = @food.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update_attributes(food_params)
      flash[:notice] = "Sounds delicious! Food saved."
      redirect_to foods_path
    else
      flash[:notice] = @food.errors.full_messages.join(", ")
      redirect_to :back
    end

  end

  def destroy
    Food.find(params[:id]).destroy
    flash[:notice] = "Sounds delicious! Food saved."
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :user_id, :url)
  end
end
