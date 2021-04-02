class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        binding.pry
        if google_auth
            @user = user.find_or_create_by(username: google_auth[:name], email: google_auth[:email])
            session[:user_id] = @user.id
                redirect_to pieces_path
        else
            @user = User.find_by(username: session_params[:username])
            if @user && @user.authenticate(session_params[:password])
                session[:user_id] = @user.id
                redirect_to pieces_path
            else
                @user = User.new(session_params)
                render :new
            end
        end
    end

    def logout
        session.clear
    end

    private
    
    def google_auth
        request.env['omniauth.auth']
    end

    def session_params
        params.require(:user).permit(:username, :password)
    end
end