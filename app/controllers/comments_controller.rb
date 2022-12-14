class CommentsController < ApplicationController
    def new 
        @comment=Comment.new
    end
    def create
        puts "#{params}"
        @article=Article.find(params[:article_id])
        @comment=@article.comments.new(check_params)
        puts "#{@comment[:article_id]}"
        if @article.save
            redirect_to article_path(@article)
        else
            render :"articles/show" , status: :unprocessable_entity
        end
    end
    

    private
    def check_params
        params.require(:comment).permit(:commenter,:body)
    end
end
