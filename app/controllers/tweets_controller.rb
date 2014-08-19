class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all
  end

  def create
    @user=User.find(params[:user_id])
    @tweet=@user.tweets.create(tweet_params)
    redirect_to(user_path(@user))
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
