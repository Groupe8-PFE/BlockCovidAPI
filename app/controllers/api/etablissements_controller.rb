class Api::EtablissementsController < ApplicationController
  # POST etablissement
  def create

    @adresse = Adresse.create(adresse_params)
    @etablissement = Etablissement.create(etablissement_params)
    @etablissement.adresse_id = @adresse.id
    if @etablissement.save && @etablissement.valid?
      token = JWT.encode({etablissement_id: @etablissement.id},"test","HS256")
      render json: @etablissement
      puts(@etablissement)
    else
      render json: {errors: @etablissement.errors.full_messages}
    end
  end


  def show
    @etablissement = Etablissement.find(params[:id])
    if @etablissement
      render json: {
          etablissement: @etablissement

      }
    else
      render json: {
          status: 500,
          errors: ['etablissement not found']
      }
    end
  end



  private

  def etablissement_params()

    params.permit(:nom_etablissement, :password, :email, :telephone)
  end

  def adresse_params
    params.permit(:rue, :ville, :code_postal)
  end


end