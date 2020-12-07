class Api::AdressesController < ApplicationController
  # POST medecin
  def create

    @adresse = Adresse.create(adresse_params)
    if @adresse.save
      render json: @adresse

    else
      #render error: {error: 'Impossible de créer l\'utilisateur'}, status:400
      puts("Impossible de creer l'adresse")
    end
  end


  private

  def adresse_params
    params.require(:adresse).permit(:rue, :ville, :code_postal)
  end


end