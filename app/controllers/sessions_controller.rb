class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to pieces_path
        else
            @user = User.new(session_params)
            render :new
        end
    end

    def logout
        session.clear
    end

    private
    
    def session_params
        params.require(:user).permit(:username, :password)
    end
end