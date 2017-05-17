class DancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user?
  before_action :dances, only: [:index]
  before_action :set_dance, only: [:show, :edit, :update, :destroy]
  before_action :directions?, only: [:show, :edit]
  before_action :comments?, only: [:show]
  before_action :collections, only: [:show, :new, :create, :edit, :update]
  before_action :new_direction, only: [:new, :edit]

  def index
  end

  def show
    @dance_comment = DanceComment.new
  end

  def new
    @dance = Dance.new
    @dance_direction = DanceDirection.new
  end

  def create
    # NEED TO ACCOUNT FOR THE EMPTY "" STRINGS BEING ENTERED INTO THE DATABASE IN PLACE OF NIL
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
    if comments?
      @dance.dance_comments.destroy
    end
    @dance.destroy
    redirect_to root_path
  end

  private

  def set_dance
    @dance = Dance.find(params[:id])
  end

  def dances
    @dances ||= Dance.all.order(:title)
  end

  def directions?
    @dance_directions ||= @dance.dance_directions.order(:sequence)
  end

  def comments?
    @dance_comments ||= @dance.dance_comments.order(created_at: :desc)
  end

  def collections
    @formation_collection ||= Formation.all.order(:name)
    @meter_collection ||= Meter.all.order(:name)
    @comment_type_collection ||= CommentType.all.order(:name)
  end

  def new_direction
    @dance_direction = DanceDirection.new
  end

  def dance_params
    params.require(:dance).permit(
      :title,
      :formation_id,
      :meter_id,
      :author,
      :publication,
      :year,
      :complete
    )
  end
end
