class DancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dance, only: [:show, :edit, :update, :destroy]
  before_action :collections, only: [:new, :create, :edit, :update]

  def index
    @dances = Dance.all
  end
  def show
    @creator = creator?
  end

  def new
    @dance = Dance.new
  end

  def create
    @dance = Dance.new(dance_params.merge(user_id: current_user.id.to_s))
    if @dance.save
      redirect_to dance_path(@dance.id)
    else
      flash[:alert] = @dance.errors.full_messages.join(", ")
      render new_dance_path
    end
  end

  def destroy
    if creator?
      @dance.destroy
      redirect_to root_path
    else
      redirect_to dance_path(@dance)
    end
  end

  private

  def set_dance
    @dance = Dance.find(params[:id])
  end

  def dance_params
    params.require(:dance).permit(
      :title,
      :formation_id,
      :meter_id,
      :author,
      :publication,
      :year,
      :direction
    )
  end

  def collections
    @formation_collection = Formation.all
    @meter_collection = Meter.all
  end

  def creator?
    current_user && current_user.id == @dance.user_id
  end
end
