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

    def create_from_google
        @user = User.find_or_create_by(username: google_auth[:name], email: google_auth[:email])
        if !@user.password
        @user.password = SecureRandom.base36
        end
        if @user.save && @user.authenticate(@user.password)
            session[:user_id] = @user.id
            redirect_to pieces_path
        else
            @user = User.new(session_params)
            render :new
        end
    end

    def logout
        session.clear
        redirect_to '/'
    end

    private
    
    def google_auth
        request.env['omniauth.auth'][:info]
    end

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end
end