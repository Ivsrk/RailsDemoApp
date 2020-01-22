class CategoriesController < ApplicationController
    before_action :load_category ,only: [:show, :edit, :update, :destroy]
    def index
        @categories=Category.all
    end
    def show
    end
    def destroy
        @category.destroy
        respond_to do |format|
            format.html { redirect_to categories_path, notice: 'category was successfully destroyed.' }
            format.json { head :no_content }
          end
        #redirect_to categories_path
    end
    def new
        @category=Category.new
    end
    def create
        
        @category=Category.new(params[:category].permit(:name))
        
        #@category.word_count=@category.description.chars.count
        @category.save
        respond_to do |format|
            if @category.save
                format.html { redirect_to @category, notice: 'category was successfully created.' }
                #format.json { render :show, status: :created, location: @post }
              else
                format.html { render :new }
                #format.json { render json: @post.errors, status: :unprocessable_entity }
              end
        end

        #redirect_to category_path(@category)
    end
    def edit

    end
    def update
        
        if @category.update(update_params)
           # @category.word_count=@category.description.chars.count
            redirect_to category_path(@category)
        else
            render :edit
        end
    end
    private
    def load_category
        @category=Category.find_by(id:params[:id])

    end
    def update_params
        params[:category].permit(:name)
    end



end
  