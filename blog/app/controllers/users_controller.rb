class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @users
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        render json: @users
      else
        render :edit
      end
    end
  
    private
  
    def find_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  