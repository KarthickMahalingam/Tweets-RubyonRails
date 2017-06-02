class CommentsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @user_detail = User
    @comment = Comment.where(:post_id => params[:id])
  end

  def new

  end

  def create
    @comment  = Comment.new(comment_params)
    #@posts.errors
    if @comment.save
      flash[:success] = ''
      redirect_to :back, :notice => 'Yay!! You comments on your friends tweet!!'
    else
      flash[:fail] ='Didnt commit'
      redirect_to :back, :alert => 'Some error occured!!Try resubmitting the comments'
    end
  end

  private
  def comment_params
    params.require(:comments).permit(:author_id, :post_id, :comment)
  end


end
