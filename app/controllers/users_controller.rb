class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      ## Also sign in user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{ @user.username }, to the Alpha Blog!"
      redirect_to articles_path
    else
      render "new"
    end
  end

  def show
    #@user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Your account info was updated!"
      redirect_to @user
    else
      render "edit"
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user= User.find(params[:id])
  end

  def require_same_user
    if @user != current_user
      flash[:alert] = "You can only edit of delete your own profile"
      redirect_to current_user
    end
  end

end