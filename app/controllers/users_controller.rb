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

  def edit
    @user=User.find(params[:id])
  end
  def update
    @user=User.find(params[:id])
    if @user.update(strong_params)
      redirect_to(@user)
    else
      render "edit"
    end
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
