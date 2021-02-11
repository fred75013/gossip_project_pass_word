class CommentController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.find(params[:id])
  end

  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.new(content: params[:content],gossip: Gossip.find(params[:gossip_id]), user: current_user)

    if @comments.save
      redirect_to Gossip.find(params[:gossip_id])
    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end

  def edit
    @comments = Comment.find(params[:id])
    @gossips = Gossip.find(params[:gossip_id])
  end

  def update
    @comments = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)
    if @comments.update(comment_params)
      redirect_to Gossip.find(params[:gossip_id])
    else
      render :edit
    end
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to Gossip.find(params[:gossip_id])
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
