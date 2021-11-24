class ReviewsController < ApplicationController
  def create
    @review = Review.new
    @review.makii_id = params[:makii_id]
    @review.rate = params[:makii][:rate]
    @review.save
    redirect_to makii_path(params[:makii_id])
  end

  def destroy
  end
end
