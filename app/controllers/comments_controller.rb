class CommentsController < ApplicationController
   def create
    @maki = Makii.find(params[:makii_id])
    @comment = current_user.comments.new(comment_params)
    @comment.makii_id = @maki.id
    @comment.save
    #@comment_makii.create_notification_comment!(current_user, @comment.id)
   end


   def destroy
     @maki = Makii.find(params[:makii_id])
     Comment.find_by(id: params[:id], makii_id: params[:makii_id]).destroy
    #BookComment.find_by(id: params[:id]).destroy
   end



  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
