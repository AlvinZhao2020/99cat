class CatsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id:params[:id])
        if @cat
            render 'show'  
        else
            redirect_to '/cats'
        end
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save!
            redirect_to cat_url(@cat)
        else
            render :new 
        end

    end

    def new 
        render :new
    end

    def edit
        @cat = Cat.find_by(id:params[:id])
        render :edit
    end

    def update
        @cat  = Cat.find_by(id:params[:id])
        if @cat.update_attributes(cat_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    def destroy
        @cat = Cat.find_by(id:params[:id])
        if @cat
            @cat.destroy
        end
        redirect_to :index
    end

    private

    def cat_params
        params.require(:cat).permit(:color,:sex,:name,:birth_date,:description)
    end
end
