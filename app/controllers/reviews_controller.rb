class ReviewsController < ApplicationController
  before_action :set_list

  def new
    @review = @list.reviews.new
  end

  def create
    @review = @list.reviews.new(review_params)
    if @review.save
      redirect_to list_path(@list), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
