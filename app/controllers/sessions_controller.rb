class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user
            session[:user_id] = @user.id
            redirect_to pieces_path
        else
            render :new
        end
    end

    def logout
    end

    private
    
    def session_params
        params.require(:user).permit(:username, :password)
    end
end