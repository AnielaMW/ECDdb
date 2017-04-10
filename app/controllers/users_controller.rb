class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @dances = list_dances
    @dance_comments = list_dcomments
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def list_dances
    @user.dances.order(:title)
  end

  def list_dcomments
    @user.dance_comments.order(created_at: :desc)
  end
end
