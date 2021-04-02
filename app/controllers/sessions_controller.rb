class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #binding.pry
        if google_auth
            @user = User.find_or_create_by(username: google_auth[:name], email: google_auth[:email])do
            #binding.pry
            @user.password= SecureRandom.base36
            end
        else
            @user = User.find_by(username: session_params[:username])
        end
        @password = @user.password
        if @user && @user.authenticate(@password)
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
    
    def google_auth
        request.env['omniauth.auth'][:info]
    end

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end
end