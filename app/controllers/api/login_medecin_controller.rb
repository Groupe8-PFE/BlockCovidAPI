
class Api::LoginMedecinController < ApplicationController
  # "log the medecin in"
  def login
    @medecin= Medecin.find_by(email: login_params[:email])
    if @medecin && @medecin.authenticate(login_params[:password])
      token = JWT.encode({medecin_id: @medecin.id}, "test", 'HS256')
      render json: {medecin: @medecin, token: token}
    else
      render json: {errors: @medecin.errors.full_messages}
    end
  end

  def persist
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      puts encoded_token
      token = JWT.decode(encoded_token, "test")
      medecin_id = token[0]['medecin_id']
      medecin = Medecin.find(medecin_id)
      render json: medecin
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end

