class CommentsController < ApplicationController
  def create
    @new_reply_comment = Comment.new()
    @maki = Makii.find(params[:makii_id])
    @comment = current_user.comments.new(comment_params)
    @comment.score = Language.get_data(comment_params[:comment])
    @comment.makii_id = @maki.id
    unless @comment.save
      render 'error'
    end
      @maki.create_notification_comment!(current_user, @comment.id)

  end

  def destroy
    @maki = Makii.find(params[:makii_id])
    
    Comment.find_by(id: params[:id], makii_id: params[:makii_id]).destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:reply_comment)
  end
end
