class BookCommentsController < ApplicationController
    def index

    end

    def create
        @comments = Book_comment.new(comment_params)
        if @comments.save
          redirect_to book_path(@comment.book), notice: "Object successfully created"
        else
          render :index
        end
    end

    def edit
        @comment = Book_comment.find(params[:id])
    end

    def update
        @comment = Book_comment.find(params[:id])
        if @comment.update(comment_params)
          redirect_to book_path(@comment.book), notice: "Object was successfully updated"
        else
          render 'edit'
        end
    end

    def destroy
        @comment = Book_comment.find(params[:id])
        if @comment.destroy
            redirect_to book_path(@comment.book), notice:'Object was successfully deleted.'
        else
            render book_path(@comment.book)
        end
    end

    private
    def comment_params
      params.require(:book_comment).permit(:body,:book_id).merge(user_id: current_user.id)
    end
    
end
