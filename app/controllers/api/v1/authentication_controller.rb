class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request,  :raise => false


  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user_id)
      render json: { token: token}, status: :ok 
    else
      render json: { error: 'unauthorized'}, status: :unauthroized
    end
  end
end