class MapsController < ApplicationController

  def index
    @maps = Map.includes(:user).order(created_at: "DESC").page(params[:page]).per(1)
  end
end
