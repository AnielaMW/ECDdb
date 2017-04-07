class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @dances = list_dances.sort_by { |d| d.title }
    @dance_comments = list_dcomments.sort_by { |d| d.created_at }.reverse
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def list_dances
    @user.dances
  end

  def list_dcomments
    @user.dance_comments
  end
end
