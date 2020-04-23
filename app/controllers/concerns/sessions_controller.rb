class SessionsController < ApplicationController

def index

end

def new

end

def create
    user =User.find_by(username: params[:session][:Username])
    if user && user.authenticate(params[:session][:password])
        session[:user_id]= user.id
        flash[:success]="You have successfully logged in"
        redirect_to root_path

    else
        flash.now[:error]="Invalid Login credentials"
        render 'new'
    end

end

def destroy
    session[:user_id]=nil
    flash[:success]="You have been seccessfully logged out"
    redirect_to login_path
end

end