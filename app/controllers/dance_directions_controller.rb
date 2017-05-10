class DanceDirectionsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :admin_user?, only: [:show]
  before_action :set_dance_direction, only: [:show, :edit, :update, :destroy]
  before_action :set_dance, only: [:new, :create]

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_dance_direction
    @dance_direction ||= DanceDirection.find(params[:id])
  end

  def set_dance
    @dance ||= Dance.find(params[:dance_id])
  end

  def dance_direction_params
    params.require(:dance_direction).permit(
      :dance_id,
      :sequence,
      :mark,
      :measure,
      :direction,
      :position
    )
  end
end
