class FormationsController < ApplicationController
  before_action :admin_user?, except: [:index]
  before_action :set_formation, only: [:show, :edit, :update, :destroy]

  def index
    @formations = formations.sort_by{ |f| f.name }
  end

  def show
    @admin = admin_user?
  end

  def new
    @formation = Formation.new
  end

  def create
    @formation = Formation.new(formation_params)
    if @formation.save
      redirect_to new_dance_path
    else
      flash[:alert] = @formation.errors.full_messages.join(", ")
      render new_formation_path
    end
  end

  def edit
  end

  def update
    if @formation.update(formation_params)
      redirect_to formation_path(@formation)
    else
      flash[:alert] = @formation.errors.full_messages.join(", ")
      redirect_to edit_formation_path(@formation)
    end
  end

  def destroy
    if admin_user?
      @formation.destroy
      redirect_to formations_path
    else
      redirect_to formation_path(@formation)
    end
  end

  private

  def admin_user?
    current_user && current_user.admin == true
  end

  def formations
    Formation.all
  end

  def set_formation
    @formation = Formation.find(params[:id])
  end

  def formation_params
    params.require(:formation).permit(
      :name,
      :description
    )
  end
end
