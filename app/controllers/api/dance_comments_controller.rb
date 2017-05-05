class Api::DanceCommentsController < ApplicationController
  def index
    # set_dance_comment
    @dc = DanceComment.where(
      "comment = ? and
      comment_type_id = ? and
      user_id = ? and
      dance_id = ?",
      dc_params[:comment],
      dc_params[:comment_type_id],
      dc_params[:user_id],
      dc_params[:dance_id]).order(created_at: :desc
    ).first

    comment = [@dc, user: @dc.user.first_name, dance: @dc.dance.title, comment_type: @dc.comment_type.name]

    render json: comment
  end

  def create
    @dance_comment = DanceComment.new(dc_params)
    @dance_comment.save
  end

  private
  def set_dance_comment
    # This creates an array of dance_comment objects of which I want only the first, but calling @dc[0] or @dc.first somehow forces a call of nil. Yet, when calling @dc[0] or @dc.first in the comand line I get the singe object I am looking for and can call things like (@dc[0].comment, @dc[0].user.first_name, and @dc[0].dance).
    # @dc = DanceComment.where(
    #   "comment = ? and
    #   comment_type_id = ? and
    #   user_id = ? and
    #   dance_id = ?",
    #   dc_params[:comment],
    #   dc_params[:comment_type_id],
    #   dc_params[:user_id],
    #   dc_params[:dance_id]).order(created_at: :desc
    # )
  end

  def dc_params
    params.require(:dance_comment).permit(
      :comment,
      :comment_type_id,
      :user_id,
      :dance_id
    )
  end
end
