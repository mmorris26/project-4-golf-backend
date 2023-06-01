class CoursesController < ApplicationController
    def index
        @course = Course.all  
        render json: @course
    end


    def show
        @course = Course.find(params[:id])
        render json: @course
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.create(params.require(:course).permit(:name, :par_score))
        render json: @course
    
      
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        @course.update(params.require(:course).permit(:name, :par_score))
        render json: @course
    
       
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
       
    end

end

