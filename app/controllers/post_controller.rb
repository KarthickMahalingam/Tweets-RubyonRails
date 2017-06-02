class PostController < ApplicationController
  def new
    @posts = Post.new
    if @posts.save
      flash[:success] = "Congrats!! Your status posted"
      redirect_to :controller => 'main', :action => 'index'
    end
  end

  def create

    @posts  = Post.new(status_params)
    #@posts.errors
    if @posts.save
      flash[:success] = 'Congrats!! Your status posted'
      redirect_to :back, :notice => 'Yay!! You tweets posted on your timeline!!'
    else
      flash[:fail] ='Didnt commit'
      redirect_to :back,  :alert => 'Some error occured!! Try resubmitting the status'
    end


  end

  private
  def status_params
    params.require(:post).permit(:author_id, :status, :title)
  end
end
