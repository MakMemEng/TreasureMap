class AffirmationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @affirmations = Affirmation.includes(:user).order(id: "DESC").page(params[:page]).per(25)
  end

  def show
    @affirmation = Affirmation.find(params[:id])
  end

  def new
    @affirmation = Affirmation.new
  end

  def create
    @affirmation = current_user.affirmations.build(affirmation_params)
    if @affirmation.save
      redirect_to affirmation_path(@affirmation), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @affirmation = Affirmation.find(params[:id])
    if @affirmation.user != current_user
      redirect_to affirmations_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @affirmation = Affirmation.find(params[:id])
    if @affirmation.update(affirmation_params)
      redirect_to affirmation_path(@affirmation), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    affirmation = Affirmation.find(params[:id])
    affirmation.destroy
    redirect_to user_path(affirmation.user)
  end

  private
  def affirmation_params
    params.require(:affirmation).permit(:title, :body, :image)
  end
end
