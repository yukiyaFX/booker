class UsersController < ApplicationController
    def index
        @users=User.all.order("id DESC")
        @new_book = Book.new
        @user = current_user
    end

    def show
        @user = User.find(params[:id])
        @new_book = Book.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if current_user
            if @user.update(user_params)
                redirect_to user_path(current_user) ,notice:"User was successfully updated"
            else
                render :index
            end
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:introduction,:image,:profile_image)
    end
end
