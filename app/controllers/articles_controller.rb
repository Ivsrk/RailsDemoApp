class ArticlesController < ApplicationController
    before_action :load_article ,only: [:show, :edit, :update, :destroy]
    def index
        @articles=Article.all
    end
    def show
    end
    def destroy
        @article.destroy
        respond_to do |format|
            format.html { redirect_to articles_path, notice: 'Article was successfully destroyed.' }
            format.json { head :no_content }
          end
        #redirect_to articles_path
    end
    def new
        @article=Article.new
    end
    def search
    end
    def create
        
        @article=Article.new(params[:article].permit(:title,:user_id,:description))
        
        #@article.word_count=@article.description.chars.count
        @article.save
        respond_to do |format|
            if @article.save
                format.html { redirect_to @article, notice: 'Article was successfully created.' }
                #format.json { render :show, status: :created, location: @post }
              else
                format.html { render :new }
                #format.json { render json: @post.errors, status: :unprocessable_entity }
              end
        end

        #redirect_to article_path(@article)
    end
    def edit

    end
    def update
        
        if @article.update(update_params)
           # @article.word_count=@article.description.chars.count
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    private
    def load_article
        @article=Article.find_by(id:params[:id])

    end
    def update_params
        params[:article].permit(:title,:user_id,:description)
    end



end
  