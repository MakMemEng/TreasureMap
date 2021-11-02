class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if !current_user.admin?
      if @user != current_user
        redirect_to users_path, alert: '不正なアクセスです。'
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '投稿に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザー情報を削除しました。"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
