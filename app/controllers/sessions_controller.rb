class SessionsController < ApplicationController
    def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :ok
      else
        render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
      end
    end
  
    def destroy
      session[:user_id] = nil
      head :no_content
    end
  end
  