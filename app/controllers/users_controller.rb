class UsersController < ApplicationController
  http_basic_authenticate_with name: "sbs", password: "123456", except: [:index, :show]
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
    @tweet=@user.tweets.new
  end

  def create
    @user=User.create(strong_params)
    respond_with @user
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    respond_with @user
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to(@user)
  end

  private
  def strong_params
    params.require(:user).permit(:name,:surname,:email,:bio)
  end
end
