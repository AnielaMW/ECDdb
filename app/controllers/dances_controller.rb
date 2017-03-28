class DancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dance, only: [:show]

  def index
    @dances = Dance.all
  end

  def show
  end

  private
  def set_dance
    @dance = Dance.find(params[:id])
  end
end
