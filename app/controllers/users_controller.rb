class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_normal_user, only: %i[update destroy]
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

  def ensure_normal_user
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
