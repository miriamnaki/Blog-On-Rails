class PostsController < ApplicationController
    before_action :find_params, only:[:show,:edit,:update,:destroy]
    def home
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new post_params
      if @post.save
        flash[:notice] = 'Post created'
        redirect_to post_path(@post.id)
      else
        render :new
      end
    end
  
    def show
      
      @comments = Comment.all
      @comments = @post.comments.order(created_at: :DESC)
      @comment = Comment.new
    end
  
    def index
      @posts = Post.all.order(created_at: :DESC)
    end
  
    def edit
      
    end
  
    def update
      
      if @post.update post_params
        flash[:notice] = 'Post updated'
        redirect_to post_path(@post.id)
      else
        render :edit
      end
    end
  
    def destroy
      
      @post.destroy
      redirect_to root_path
    end
  
    private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def find_params
      @post = Post.find params[:id]
    end
  end
  

