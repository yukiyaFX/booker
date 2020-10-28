class FavoritesController < ApplicationController
    def index

    end

    def create
        @favorite = Favorite.new(favorite_params)
        if @favorite.save
          redirect_back(fallback_location: root_path)
        else
          render 'index'
        end
    end
    

     def destroy
         @favorite = Favorite.find(params[:id])
         if @favorite.destroy
					redirect_back(fallback_location: root_path)
         else
					redirect_back(fallback_location: root_path)
         end
     end
     private
    def favorite_params
        params.require(:favorite).permit(:book_id).merge(user_id: current_user.id)
    end
end
