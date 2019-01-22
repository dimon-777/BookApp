class IllustrationsController < ApplicationController
    before_action :set_illustration, only: [:destroy, :update]
    def new
        redirect_to root_url unless session[:user_type] == 'Reader'
        @illustration = Illustration.new
    end

    def index
        @illustration = Illustration.new
        @favorites = current_user.favorites
        @illustrations = Illustration.where(user: current_user)
    end

    #Ex:- add_index("admin_users", "username")
    def create 
        @illustration = Illustration.new(illustration_params)
        if @illustration.save
            flash[:notice] = "Illustration was saved."
        else
            flash[:notice] = "Something went wrong, please try again."
        end
        # render 'new' 
        redirect_back( fallback_location: root_path )
    end

    def destroy
        if @illustration.destroy
            flash[:notice] = "Illustration was destroyed."
        else
            flash[:notice] = "Something went wrong, please try again."
        end
        redirect_back( fallback_location: root_path )
    end

    def update
        if @illustration.update (illustration_params)
            flash[:notice] = "Illustration was reviewed."
        else
            flash[:notice] = "Something went wrong, please try again."
        end
        redirect_back( fallback_location: root_path )
    end

    private
    def illustration_params
        params.require(:illustration).permit(:illustration, :user_id, :book_id, :approved)
    end

    def set_illustration
        @illustration = Illustration.find(params[:id])
    end
end
