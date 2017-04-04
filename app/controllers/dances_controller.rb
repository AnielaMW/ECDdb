class DancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dance, only: [:show, :edit, :update, :destroy]
  before_action :collections, only: [:new, :create, :edit, :update]

  def index
    @dances = dances.sort_by { |d| d.title }
  end

  def show
    @creator = creator?
    @admin_user = admin_user?
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

  def edit
  end

  def update
    if @dance.update(dance_params)
      redirect_to dance_path(@dance)
    else
      flash[:alert] = @dance.errors.full_messages.join(", ")
      redirect_to edit_dance_path(@dance)
    end
  end

  def destroy
    if @dance.dance_comments
      @dance.dance_comments.destroy
    end
    @dance.destroy
    redirect_to root_path
  end

  private

  def creator?
    current_user && current_user.id == @dance.user_id
  end

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

  def dances
    @dances ||= Dance.all
  end
end
