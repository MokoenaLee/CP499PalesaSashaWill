class SessionsController < ApplicationController

    def create
        admin = Admin.find_by(username:login_params[:username])
        if admin && admin.authenticate(login_params[:password])
            session[:admin_id] = admin.id
            redirect_to '/dashboard'

        else
            flash[:login_errors] = ['invalid credentials']
            redirect_to '/'
        end
    end

    private
        def login_params
            params.require(:login).permit(:username, :password)
        end

end
