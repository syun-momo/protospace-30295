class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :move_to_index, only: [:edit, :update]
  
  def index
    @prototypes = Prototype.all
    @user = User.all
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @prototypes = Prototype.all
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    prototype = Prototype.find(params[:id])
    unless prototype.user == current_user
      redirect_to action: :index 
    end
  end

end
