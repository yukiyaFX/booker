class BookCommentsController < ApplicationController
    def index

    end

    def create
        @comment = BookComment.new(comment_params)
        if @comment.save
          redirect_to book_path(@comment.book), notice: "Object successfully created"
        else
          render :index
        end
    end

    def edit
        @comment = BookComment.find(params[:id])
    end

    def update
        @comment = BookComment.find(params[:id])
        if @comment.update(comment_params)
          redirect_to book_path(@comment.book), notice: "Object was successfully updated"
        else
          render 'edit'
        end
    end

    def destroy
        @comment = BookComment.find(params[:id])
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
