class Api::V1::UsersController < ApplicationController
    def signup
        puts user_params, "asdf"
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :bad_request
        end
    end

    def signin
        puts signin_params
        @user = User.find_by(email: signin_params[:email])
        
        if !!@user && @user.authenticate(signin_params[:password])
            @token = encode_token(user_id: @user.id)
            render json: {
                token: @token
            }, status: :accepted
        else
            render json: {message: 'Username or password is incorrect'}, status: :unauthorized
        end
    end

    private
    def user_params
        params.permit(:firstName, :lastName, :email, :password, :country, :username)
    end

    private
    def signin_params
        params.require(:auth).permit(:email, :password)
    end
end
