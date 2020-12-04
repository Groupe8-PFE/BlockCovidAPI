class Api::MedecinsController < ApplicationController
  # POST medecin
  def create
    @medecin = Medecin.new(medecin_params)
    if @medecin.save
      render json: @medecin
      puts(@medecin)
      printf("test reussi")
    else
      render error: {error: 'Impossible de créer l\'utilisateur'}, status:400
      puts("Impossible de creer l'user")
    end
  end


    private

    def medecin_params
      params.require(:mededin).permit(:nom,:prenom,:inami,:mail,:telephone)
    end


end
