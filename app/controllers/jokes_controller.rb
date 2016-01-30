class JokesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @jokes = Joke.paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @joke = Joke.new
  end
  
  def show
    @joke = Joke.find(params[:id])
  end
  
  def create
    @joke = Joke.new(joke_params)
    if @joke.save
      flash[:notice] = "I lold. Joke saved"
      redirect_to jokes_path
    else
      flash[:error] = @joke.errors.full_messages.join(", ")
      redirect_to :back
    end
  end
  
  def edit
    @joke = Joke.find(params[:id])
  end
  
  def update
    @joke = Joke.find(params[:id])
    
    if @joke.update_attributes(joke_params)
      flash[:notice] = "I lold. Joke saved"
      redirect_to jokes_path
    else
      flash[:notice] = @joke.errors.full_messages.join(", ")
      redirect_to :back
    end
      
  end
  
  def destroy
    Joke.find(params[:id]).destroy
    flash[:notice] = "Joke deleted"
    redirect_to jokes_path
  end
  
  private
  
  def joke_params
    params.require(:joke).permit(:content, :user_id)
  end
end
