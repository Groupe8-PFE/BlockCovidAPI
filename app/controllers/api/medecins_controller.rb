class Api::MedecinsController < ApplicationController
  # POST medecin
  def create

    @adresse = Adresse.create(adresse_params)
    @medecin = Medecin.create(medecin_params)
    @medecin.adresse_id = @adresse.id
    if @medecin.save
      login!
      render json: @medecin
      puts(@medecin)
      printf("test reussi")
    else
      render error: {error: 'Impossible de créer l\'utilisateur'}, status:400
      puts("Impossible de creer l'user")
    end
  end


  def show
    @medecin = Medecin.find(params[:id])
    if @medecin
      render json: {
          medecin: @medecin
      }
    else
      render json: {
          status: 500,
          errors: ['medecin not found']
      }
    end
  end



    private

    def medecin_params()

      params.permit(:nom,:prenom,:inami,:email, :telephone, :mot_de_passe_hash, :mot_de_passe_salt)
    end

    def adresse_params
      params.permit(:rue, :ville, :code_postal)
    end


end
