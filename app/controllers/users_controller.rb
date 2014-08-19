class UsersController < ApplicationController
  def index
    @users=User.all
  end
  def new
    @user=User.new
  end
  def show
    @user=User.find(params[:id])
  end

  def create
    @user=User.new(strong_params)
    if @user.save
      redirect_to(@user)
    else
      render "new"
    end

  end
  private
  def strong_params
    params.require(:user).permit(:name,:surname,:email,:bio)
  end
end
