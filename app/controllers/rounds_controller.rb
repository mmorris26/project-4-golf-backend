class RoundsController < ApplicationController

    before_action :authenticate_user!

    def index
        @round = Round.all  
        render json: {status: 'SUCCESS', message: 'Loaded rounds', data:@round}, status: :ok
    end


    def show
        @round = Round.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded round', data:@round}, status: :ok
    end

    def new
        @round = Round.new
    end

    def create
        @round = Round.create(params.require(:round).permit(:date, :number_of_holes, :score, :guest_name, :guest_score, :course_id, :user_id))
        if @round.save
            render json: {status: 'SUCCESS', message: 'Round is saved', data:@round}, status: :ok
          else
            render json: {status: 'Error', message: 'Round is not saved', data:@round.errors}, status: :unprocessable_entity
          end
    
       
    end

    def edit
        @round = Round.find(params[:id])
    end

    def update
        @round = Round.find(params[:id])
        
        if @round.update(params.require(:round).permit(:date, :number_of_holes, :score, :guest_name, :guest_score, :course_id, :user_id))
            render json: {status: 'SUCCESS', message: 'Round is updated', data:@round}, status: :ok
          else
            render json: {status: 'Error', message: 'Round is not updated', data:@round.errors}, status: :unprocessable_entity
          end
    end

    def destroy
        @round = Round.find(params[:id])
        @round.destroy
        
        render json: {status: 'SUCCESS', message: 'Round successfully deleted', data:@round}, status: :ok

    end

    def current_round
        @round = Round.last
        render json: @round
    end

    



end

