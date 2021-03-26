class CommentsController < ApplicationController
  before_action :find_params
  before_action :authenticated_user!,only:[:create]
    
    def create 
      @comments = Comment.all
      @comment = Comment.new comment_params
      @comment.post = @post
      @post.user = current_user
      if @comment.save
        flash[:notice] = "Comment saved"
        redirect_to post_path(@post.id)
      else
        render '/posts/show'
      end
    end
  
    def destroy
      @comment = Comment.find params[:id]
      @comment.destroy
      redirect_to post_path(@post.id)
    end
  
    private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_params
      @post = Post.find params[:post_id]
    end
  
  end
  

