class UsersController < ApplicationController
    before_action :require_user
    def new
     @user=User.new
    end

    def create
     @user=User.new(user_params)
     if @user.save
        session[:user_id]=@user.id 
        flash[:success]="Welcome to the chatroom."
        redirect_to root_path(@user)
     else
        redirect_to login_path
     end  
    end

    private 

    def user_params
     params.require(:user).permit(:username, :password)
    end

    def require_user
      if logged_in?
         flash[:error]="You must be logged out first"
         redirect_to root_path
      end
    end
end
