class Api::MedecinsController < ApplicationController
  # POST medecin
  def create
    @adresse = Adresse.create(adresse_params)
    #@medecin = Medecin.create(medecin_params)
    @medecin = @adresse.medecins.create(medecin_params)
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

      params.require(:medecin).permit(:nom,:prenom,:inami,:email, :mode_de_passe, :telephone)
    end

    def adresse_params
      params.require(:adresse).permit(:rue, :ville, :code_postal)
    end


end
