class InterviewsController < ApplicationController

    before_action :set_interview, only: [:show,:edit,:update,:destroy]
  
    def show
      @users = @interview.users
      render json: @interview, status: 200
    end
  
    def index
      @interviews = Interview.all
      render json: @interviews, status: 200
    end
  
    def create
      @interview = Interview.new(interview_params) 
      if @interview.save
        render json: @interview, status: 200
      else
        render json: {error: @interview.errors.full_messages}, status: 400
      end
    end

    def update
      if @interview.update(interview_params)
        render json: @interview, status: 200
      else
        render json: {error: @interview.errors.full_messages}, status: 400
      end
    end
  
    def destroy
        @interview.destroy
        render json: {message: "interview successfully deleted."}, status: 200
    end
  
    private

    def set_interview
      @interview = Interview.find(params[:id])
    end
  
    def interview_params
      params.permit(:starttime,:endtime, user_ids: [])
    end
  
end
  