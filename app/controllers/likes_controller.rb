class LikesController < ApplicationController
  def create
    like = current_user.likes.create(language_id: params[:language_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(language_id: params[:language_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end

end

