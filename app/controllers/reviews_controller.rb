class ReviewsController < ApplicationController
  def create
    #レビューが作成されるか更新されるかURLで判断できない　便宜上createで更新を行う
    @review = Review.where(user_id:current_user.id,makii_id:params[:makii_id]).first || Review.new(user_id:current_user.id,makii_id:params[:makii_id])
    @review.rate = params[:review][:rate]
    @review.save
    @maki = @review.makii
    flash[:success] = "評価しました！"
    # redirect_to makii_path(@review.makii_id)
  end

  def destroy
  end



  def review_params
    params.require(:review).permit(:rate)
  end
end
