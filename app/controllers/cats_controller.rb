class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
    end

    def create
    end

    def updated
    end

    def destroy
    end
end
