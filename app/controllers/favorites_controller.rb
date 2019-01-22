class FavoritesController < ApplicationController

    def all_favorites
        render json: current_user.favorites
      end

    def index
        @favorites = current_user.favorites
        booksPerPage = 5
        page = 1
        page = params[:page].to_i unless params[:page].nil?
        @favorites = @favorites.search(params[:searchTerm]) unless params[:searchTerm].nil?
        totalPages = @favorites.length / booksPerPage
        @favorites = @favorites.limit(booksPerPage).offset(page - 1)
        respond_to do |format|
            format.html { }
            format.json do
                render json: { favorites: @favorites, page: page, totalPages: totalPages }
            end
        end
    end
end
