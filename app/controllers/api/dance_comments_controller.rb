class Api::DanceCommentsController < ApplicationController
  def create
    @dance_comment = DanceComment.new(dc_params)
    @dance_comment.save

    comment = [@dance_comment,
      user: @dance_comment.user.first_name,
      dance: @dance_comment.dance.title,
      comment_type: @dance_comment.comment_type.name]

    render json: comment
<<<<<<< HEAD
=======
  end

  def destroy
    # binding.pry
    # @dance_comment = DanceComment.find_by()
    # @dance_comment.destroy
>>>>>>> ba217c524692aa75c70584c638910b5e431f04f9
  end

  private

  def dc_params
    params.require(:dance_comment).permit(
      :comment,
      :comment_type_id,
      :user_id,
      :dance_id,
      :comment_id
    )
  end
end
