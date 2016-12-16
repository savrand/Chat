class UserCategoriesController < ApplicationController
  before_action :set_params, only: [:create, :destroy]

  def create
    current_user.follow_category!(@category)
    redirect_to :back
  end

  def destroy
    current_user.unfollow_category!(@category)
    redirect_to :back
  end

  private
    def set_params
      @category = Category.find(params[:category_id])
    end
end
