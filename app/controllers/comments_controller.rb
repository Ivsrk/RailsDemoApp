class CommentsController < ApplicationController
   #before_action :set_comment, except: [:create]
   before_action :set_post, except: [:create]

	def create
        
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :comment))

        redirect_to post_path(@post)
        
      
    end

    def destroy
       @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    def index
        @post = Post.find(params[:post_id])
        @comments=@post.comments
    end
    def new
        @comment=Comment.new
    end
    def edit
      set_post
      set_comment
    end
    def update
      set_comment
      if @comment.update(params.require(:comment).permit(:name, :comment))
        redirect_to post_path(@post)
      else
        render :edit 
      end
    end

  private
  def set_comment
    @comment= Comment.find(params[:id])
  end
  def set_post
    @post=Post.find(params[:post_id])
    end
      # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :comment)
    end
end