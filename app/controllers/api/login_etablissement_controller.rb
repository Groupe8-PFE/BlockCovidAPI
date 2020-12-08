class Api::LoginEtablissementController < ApplicationController
  # "log the  in"
  def login
    @etablissement= Etablissement.find_by(email: login_params[:email])
    if @etablissement && @etablissement.authenticate(login_params[:password])
      token = JWT.encode({etablissement_id: @etablissement.id}, "test", 'HS256')
      render json: {etablissement: @etablissement, token: token}
    else
      render json: {errors: @etablissement.errors.full_messages}
    end
  end

  def persist
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = JWT.decode(encoded_token, "test")
      etablissement_id = token[0]['etablissement_id']
      etablissement = Etablissement.find(etablissement_id)
      render json: etablissement
    end
  end

  private

  def login_params
    params.permit(:login_etablissement,:email, :password)
  end
end