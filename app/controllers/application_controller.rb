class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    helper_method :get_current_favorites
    def current_user
        User.find(session[:user_id])
    end

    def get_current_favorites
    
     current_user.favorites
        .order({created_at: :desc})
        .slice(0, 3)
    end
    
    private
    def logged_in?
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end


