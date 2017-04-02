class CommentTypesController < ApplicationController
  before_action :admin_user?
  before_action :set_comment_type, only: [:show, :edit, :update, :destroy]

  def index
    @comment_types = comment_types.sort_by { |f| f.name }
  end

  def show
    @admin = admin_user?
  end

  def new
    @comment_type = CommentType.new
  end

  def create
    @comment_type = CommentType.new(comment_type_params)
    if @comment_type.save
      redirect_to new_dance_path
    else
      flash[:alert] = @comment_type.errors.full_messages.join(", ")
      render new_comment_type_path
    end
  end

  def edit
  end

  def update
    if @comment_type.update(comment_type_params)
      redirect_to comment_type_path(@comment_type)
    else
      flash[:alert] = @comment_type.errors.full_messages.join(", ")
      redirect_to edit_comment_type_path(@comment_type)
    end
  end

  def destroy
    if admin_user?
      @comment_type.destroy
      redirect_to comment_types_path
    else
      redirect_to comment_type_path(@comment_type)
    end
  end

  private

  def admin_user?
    current_user && current_user.admin == true
  end

  def comment_types
    CommentType.all
  end

  def set_comment_type
    @comment_type = CommentType.find(params[:id])
  end

  def comment_type_params
    params.require(:comment_type).permit(
      :name,
      :description
    )
  end
end
