class Api::DancesController < ApplicationController
  def create
    @dance = Dance.new(dance_params)
    @dance.save

    dance = [@dance,
      user: @dance.user.first_name,
      formation: @dance.formation.name,
      meter: @dance.meter.name]

    render json: dance
  end

  private

  def dance_params
    params.require(:dance).permit(
      :title,
      :author,
      :publication,
      :year,
      :formation_id,
      :user_id,
      :meter_id
    )
  end
end
