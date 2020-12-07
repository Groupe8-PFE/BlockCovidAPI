
class LoginMedecinsController < ApplicationController
  # "log the medecin in"
  def create
    if medecin = Medecin.authenticate(params[:email], params[:mot_de_passe_hash])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_medecin_id] = medecin.id
      redirect_to '/api/medecin'
    else
      puts("Erreur d'authentification.")
    end


  end


  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session.delete(:current_medecin_id)
    # Clear the memoized current user
    @_current_medecin = nil
    redirect_to '/api/medecin'
  end
end

