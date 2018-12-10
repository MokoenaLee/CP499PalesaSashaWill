class AdminsController < ApplicationController

    def index

    end

    def create
        admin = Admin.new(admin_params)
        if admin.save
            session[:admin_id] = admin.id
            redirect_to '/dashboard'
        else
            flash[:register_errors] = admin.errors.full_messages
            redirect_to '/'
        end
    end

    private
        def admin_params
            params.require(:admin).permit(:username, :password, :password_confirmation)
        end
end
