class UsersController < ApplicationController

    def new
        @user = User.new
        @user.museums.build
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to pieces_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, museum_ids:[], museums_attributes:[:name, :location])
    end

end