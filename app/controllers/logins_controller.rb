class LoginsController < ApplicationController
    #before_action :load_params
    def index
        @logins=Login.all
    end
    def show
    end
    def new
        @login=Login.new
    end
    def edit
        
    end
    def create
        respond_to do |format|
            if @login.save
              format.html { redirect_to @login, notice: 'Succesfully Signed Up.' }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { render :new }
              format.json { render json: @login.errors, status: :unprocessable_entity }
            end
          end
    end
    def update
    end
    private
        def load_params
            @login = Login.find(params[:id])
        end

end