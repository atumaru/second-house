class UsersController < ApplicationController
  def show
    @p =Tweet.ransack(params[:q])  
  @results = @p.result
    @user = User.find(params[:id])
  end

  def edit
    @p =Tweet.ransack(params[:q])  
    @results = @p.result
  end
  def update
   
    @p =Tweet.ransack(params[:q])  
    @results = @p.result
   if current_user.update(user_params)
    redirect_to user_path(current_user)
   else
    render :edit
   end
   
  end
  private
  def user_params
    params.require(:user).permit( :email,:nickname,:first_name,:last_name,:prefecture_id,:prefecture_now_id)
  end


end
