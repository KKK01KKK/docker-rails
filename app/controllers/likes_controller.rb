class LikesController < ApplicationController
  before_action :authenticate_user
  
  def create
    @like = Like.new(
        user_id: @current_user.id,
        course_id: params[:course_id]
    )
    @like.save
    redirect_to("/courses/#{params[:course_id]}")
  end

  def destroy
    @like = Like.find_by(
        user_id: @current_user.id,
        course_id: params[:course_id]
    )
    @like.destroy
    redirect_to("/courses/#{params[:course_id]}")
  end
  
end