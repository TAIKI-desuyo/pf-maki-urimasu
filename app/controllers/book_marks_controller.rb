class BookMarksController < ApplicationController
  before_action :authenticate_user!
  def create
    @maki = Makii.find(params[:makii_id])
    bookmark = current_user.book_marks.new(makii_id: @maki.id)
    bookmark.save
  end

  def destroy
    @maki = Makii.find(params[:makii_id])
    bookmark = current_user.book_marks.find_by(makii_id: @maki.id)
    bookmark.destroy
  end

  def index
    @bookmarks = BookMark.where(user_id: current_user.id)
    @makis = Makii.where(id: @bookmarks.map(&:makii_id))
  end
end
