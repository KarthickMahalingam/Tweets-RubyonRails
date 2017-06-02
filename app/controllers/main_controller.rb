class MainController < ApplicationController
    def show
      render template: "static_pages/index"
    end
    def index
      @post_all = Post.all.reverse_order
      @user_all = User
    end

    alias_method :devise_current_user, :current_user

    def current_user
      if params[:user_id].blank?
        devise_current_user
      else
        #@loggeduser=User.find(params[:user_id])
      end
    end

    def new
      @main = Post.new
    end

    def create
      @main = Post.new(status_params)
      if @main.save
        redirect_to :controller => 'main', :action => 'index'
      end
    end

    private
    def status_params
      params.require(:posts).permit(:author_id, :status, :title, :status)
    end

end
