class MakiisController < ApplicationController
  before_action :authenticate_user!
  def new
    @maki = Makii.new
  end

  def create
    @maki = Makii.new(maki_params)
    @maki.user_id = current_user.id
    if @maki.save
      redirect_to makii_path(@maki.id)
    else
      render :new
    end
  end

  def index
    @makis = Makii.all
    @makis = Makii.page(params[:page]).reverse_order
  end

  def show
    @maki = Makii.find(params[:id])
    @comment = Comment.new
    # もしレビュー数が0だったら
    @review = Review.new(makii_id:@maki.id)
  end

  def edit
    @maki = Makii.find(params[:id])
  end

  def update
    @maki = Makii.find(params[:id])
    @maki.update(maki_params)
    redirect_to makii_path(@maki.id)
  end

  def destroy
    @maki = Makii.find(params[:id])
    @maki.destroy
    redirect_to makiis_path
  end

  def rate
    @maki = Makii.find(params[:id])
    @maki.update(maki_params)
  end


  private

  def maki_params
    params.require(:makii).permit(:address, :body, :image, :amount, :cost, :is_active, :rate, :latitude, :latitude)
  end
end
