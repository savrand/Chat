class PicturesController < ApplicationController
  before_action :get_picture, only: :create

  def index
    @pictures = Picture.all.page(params[:page])
    respond_to do |format|
      format.html
      format.js do
        @pictures = Picture.joins(:comments).distinct.page(params[:page]) if params[:all] == "false"
      end
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @category = Category.find(params[:category_id])
    @comments = @picture.comments.preload(:user)
    @comment = Comment.new
    @like = @picture.likes.find_by(user: current_user)
  end

  def create
    @picture = current_user.pictures.build(get_picture)
    @picture.save!
    # if @picture.save!
    #   @picture.category.users.each do |user|
    #     UserMailer.add_picture_notification(user, @picture).deliver_later
    #   end
    # end
    # picture = Picture.new(description: params[:picture][:description], user: current_user,
    #                    category: Category.find(params[:picture][:category_id]),
    #                     location: params[:picture][:picture_file])
    # picture.save!
    redirect_to :back
  end

  private
    def get_picture
      params.require(:picture).permit(:description, :category_id, :location)
    end

end
