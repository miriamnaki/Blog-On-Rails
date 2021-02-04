class CommentsController < ApplicationController
    
    def create
      @post = Post.find params[:post_id]
      @comments = Comment.all
      @comment = Comment.new comment_params
      @comment.post = @post
      if @comment.save
        flash[:notice] = "Comment saved"
        redirect_to post_path(@post.id)
      else
        render '/posts/show'
      end
    end
  
    def destroy
      @post = Post.find params[:post_id]
      @comment = Comment.find params[:id]
      @comment.destroy
      redirect_to post_path(@post.id)
    end
  
    private
    def comment_params
      params.require(:comment).permit(:body)
    end
  
  end
  

