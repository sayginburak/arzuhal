class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all
  end
  def show
    @tweet=Tweet.find(params[:id])
  end
  def create
    @user=User.find(params[:user_id])
    @tweet=@user.tweets.create(tweet_params)
    redirect_to(user_path(@user))
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
