class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users, status: 200
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: 200
        else
          render json: {error: @user.errors.full_messages}, status: 400
        end
    end

    private
    def user_params
        params.permit(:name, :email)
    end
end
