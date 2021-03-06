class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update]
  before_action :set_user_id,   only: %i[show]
  before_action :set_search_id, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_search_id
    @p = Tweet.ransack(params[:q])
    @results = @p.result
  end

  def set_user_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :nickname, :first_name, :last_name, :prefecture_id, :prefecture_now_id)
  end
end
