class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_params

  def create
    @like = current_user.likes.create!(picture: @picture)
    respond_to do |format|
      format.html do
        puts "######################################  html"
        redirect_to :back
      end
      format.json do #{ render json: {likes_count: @picture.likes.count} }
        puts "######################################  json"
        render json: {likes_count: @picture.likes.count,
                      html: (render_to_string partial: "likes/button", layout: false, formats: [:html])}
      end
    end
  end

  def destroy
    @picture.likes.find_by(user: current_user).destroy!
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { likes_count: @picture.likes.count,
                                  html: (render_to_string partial: "likes/button", layout: false, formats: [:html])} }
    end
  end

  private

    def set_params
      @picture = Picture.find(params[:picture_id])
    end
end
