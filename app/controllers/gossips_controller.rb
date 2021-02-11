class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show] 


  def index
    @gossips = Gossip.all
  end

  def show
    @gossips = Gossip.find(params[:id])
  end

  def new
    @gossips = Gossip.new
  end
 
  def create
    @gossips = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(id: session[:user_id]))

    if @gossips.save
      redirect_to gossips_path
    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end

  def edit
    @gossips = Gossip.find(params[:id])
  end

  def update
    @gossips = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    if @gossips.update(post_params)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossips = Gossip.find(params[:id])
    @gossips.destroy
    redirect_to gossips_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end