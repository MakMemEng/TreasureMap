class MapsController < ApplicationController

  def index
    @maps = Map.includes(:user).order(id: "DESC")
  end
end
