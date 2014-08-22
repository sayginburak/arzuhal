class TweetsController < ApplicationController
  http_basic_authenticate_with name: "sbs", password: "123456", except: [:index, :show]

  def index
    @tweets=Tweet.paginate(:page => params[:page], :per_page => 5)

  end
  def show
    @tweet=Tweet.find(params[:id])
  end
  def create
    @user=User.find(params[:user_id])
    @tweet=@user.tweets.new(tweet_params)
    respond_with @user
  end
  def destroy
    @tweet=Tweet.find(params[:id])
    @tweet.destroy
    redirect_to(@tweet.user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
