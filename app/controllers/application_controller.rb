class ApplicationController < ActionController::Base
    def home
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        session[:user_id]
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to '/'
        end
    end
end
