class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user||= User.find(session[:user_id]) if session[:user_id]
      
        #here User.find(session[:user_id]) this will fetch the user based on the active session's user_id 
        #as the above line will hit the database numerous time. We don't want that so to restrict it we created a local variable to store the user once find
        #|| this pipeline symbol is for checking  
      end
      
      def logged_in?
          # this method will see if the current_user is true or not
          !!current_user
          #!!-> this symbol just converts anything to boolean
      end
      
      def require_user
         if !logged_in?
          flash[:danger]="You must be logged in to perform this action"
          redirect_to login_path
         end
         #this method restricts some functionalities for the user who is not logged in
      end
end
