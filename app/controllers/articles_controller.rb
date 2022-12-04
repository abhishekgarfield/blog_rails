class ArticlesController < ApplicationController

    def index
        @articles=Article.all
    end

    def show
        @article=Article.find(params[:id])
        @comment=Comment.new
    end

    def edit 
        @article=Article.find(params[:id])
    end

    def new
        @article=Article.new
    end

    def create
        @article=Article.new(check_params)
        if(@article.save)
            redirect_to article_path(@article)
        else
            render :new , status: :unprocessable_entity
        end
    end

    def update
        @article=Article.find(params[:id])
        puts "@@@@@#{@article[:title]}"
        if(@article.update(check_params))
            redirect_to @article
        else
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy 
        @article=Article.find(params[:id])
        @article.delete
        redirect_to "/"
    end


    private

    def check_params
        params.require(:article).permit(:title,:body)
    end

end
