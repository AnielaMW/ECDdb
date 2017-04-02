class DanceCommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user?
  before_action :set_dance_comment, only: [:show, :edit, :update, :destroy]
  before_action :collections, only: [:new, :create, :edit, :update]

  def index
    @dance_comments = dance_comments.sort_by { |d| d.title }
  end

  def show
    @creator = creator?
  end

  def new
    @dance_comment = DanceComment.new
  end

  def create
    @dance_comment = DanceComment.new(dance_comment_params.merge(user_id: current_user.id.to_s))
    if @dance_comment.save
      redirect_to dance_comment_path(@dance_comment.id)
    else
      flash[:alert] = @dance_comment.errors.full_messages.join(", ")
      render new_dance_comment_path
    end
  end

  def edit
  end

  def update
    if @dance_comment.update(dance_comment_params)
      redirect_to dance_comment_path(@dance_comment)
    else
      flash[:alert] = @dance_comment.errors.full_messages.join(", ")
      redirect_to edit_dance_comment_path(@dance_comment)
    end
  end

  def destroy
    if creator?
      @dance_comment.destroy
      redirect_to root_path
    else
      redirect_to dance_comment_path(@dance_comment)
    end
  end

  private

  def admin_user?
    current_user && current_user.admin == true
  end

  def set_dance_comment
    @dance_comment = DanceComment.find(params[:id])
  end

  def dance_comment_params
    params.require(:dance_comment).permit(
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
    @comment_type_collection = CommentType.all
  end

  def dance_comments
    DanceComment.all
  end

  def creator?
    current_user && current_user.id == @dance_comment.user_id
  end
end
