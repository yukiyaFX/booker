class FavoritesController < ApplicationController
    def index

    end

    def create
        @favorite = Favorite.new(favorite_params)
        if @favorite.save
          redirect_to book_path(@favorite.book)
        else
          render 'index'
        end
    end
    

     def destroy
         @favorite = Favorite.find(params[:id])
         if @favorite.destroy
             redirect_to books_path
         else
             redirect_to books_path
         end
     end
     
     private
    def private_params
        pamrams.require(:favorite).permit(:book_id).merge(user_id: current_user.id)
    end
    
end
