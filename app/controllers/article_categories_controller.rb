class ArticleCategoriesController < ApplicationController
    before_action :load_article_category ,only: [:show, :edit, :update, :destroy]
    def index
        @article_categories=ArticleCategory.all
    end
    def show
    end
    def destroy
        @article_category.destroy
        respond_to do |format|
            format.html { redirect_to article_categories_path, notice: 'article_category was successfully destroyed.' }
            format.json { head :no_content }
          end
        #redirect_to article_categories_path
    end
    def new
        @article_category=ArticleCategory.new
    end
    def create
        
        @article_category=ArticleCategory.new(params[:article_category].permit(:name))
        
        #@article_category.word_count=@article_category.description.chars.count
        @article_category.save
        respond_to do |format|
            if @article_category.save
                format.html { redirect_to @article_category, notice: 'article_category was successfully created.' }
                #format.json { render :show, status: :created, location: @post }
              else
                format.html { render :new }
                #format.json { render json: @post.errors, status: :unprocessable_entity }
              end
        end

        #redirect_to article_category_path(@article_category)
    end
    def edit

    end
    def update
        
        if @article_category.update(update_params)
           # @article_category.word_count=@article_category.description.chars.count
            redirect_to article_category_path(@article_category)
        else
            render :edit
        end
    end
    private
    def load_article_category
        @article_category=ArticleCategory.find_by(id:params[:id])

    end
    def update_params
        params[:article_category].permit(:name)
    end
    



end
  