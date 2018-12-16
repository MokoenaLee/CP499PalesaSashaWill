class ApplicationController < ActionController::Base
   include ActionController::MimeResponds
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    # Confirms a logged-in user.
    def logged_in_admin
        admin = Admin.find_by(username:login_params[:username])
        if current_session[:admin_id] != admin.id
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end

    private
        def login_params
            params.require(:login).permit(:username, :password)
        end


end
