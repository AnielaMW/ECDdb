class Api::DanceCommentsController < ApplicationController
  def create
    @dance_comment = DanceComment.new(dance_comment_params)
    @dance_comment.save
  end

  private

  def dance_comment_params
    params.require(:dance_comment).permit(
      :comment,
      :comment_type_id,
      :user_id,
      :dance_id
    )
  end
end
