class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @dish = Dish.find(params[:dish_id])
    @comment = @dish.comments.build(comment_params)
    @comment.chef = current_chef
    if @comment.save
      #render turbo_stream: turbo_stream.append(@comment, target: "comments")
      #ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      flash[:success] = "Comment was created successfully"
      redirect_to dish_path(@dish)
    else
    
      flash[:danger] = "Comment was not created"
      redirect_to :back
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:description)
  end
  
end