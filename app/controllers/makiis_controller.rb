class MakiisController < ApplicationController
  before_action :authenticate_user!, :set_maki, only:[:show, :edit, :update, :destroy, :rate ]
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
    @comment = Comment.new
    @review = Review.where(user_id:current_user.id,makii_id: @maki.id).first || Review.new(user_id:current_user.id,makii_id: @maki.id)
  end

  def edit
  end

  def update

    @maki.update(maki_params)
    redirect_to makii_path(@maki.id)
  end

  def destroy
    @maki.destroy
    redirect_to makiis_path
  end

  def rate
    @maki.update(maki_params)
  end


  private

  def set_maki
    @maki = Makii.find(params[:id])
  end

  def maki_params
    params.require(:makii).permit(:address, :body, :image, :amount, :cost, :is_active, :rate, :latitude, :latitude)
  end
end
