class CommentsController < ApplicationController
  before_action :set_tip
  before_action :ensure_authenticated

  def create
    @comment = Comment.new(comment_params)
    @comment.tip = @tip


    @comment.user = current_user

    respond_to do |format|

      if @comment.save
        format.html { redirect_to @tip, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @tip, alert: 'Unable to create comment.' }
      end
    end
  end

  private

    def set_tip
      @tip = Tip.find(params[:tip_id])
    end

    
    def comment_params
      params.require(:comment).permit(:body)
    end
end
