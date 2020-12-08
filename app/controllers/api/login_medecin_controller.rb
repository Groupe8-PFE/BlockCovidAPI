
class  Api::LoginMedecinsController < ApplicationController
  # "log the medecin in"
  def create
    puts 'recherche...'
    @medecin = Medecin.find_by(email: session_params[:email])
    if @medecin && @medecin.authenticate(session_params[:mot_de_passe_hash])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      login!
      render json: {
          logged_in: true,
          medecin: @medecin
      }
      puts 'reussi'
    else
      render json: {
          status: 401,
          errors: ['no such user, please try again']
      }
    end
  end
  def is_logged_in?
    if logged_in? && current_medecin
      render json: {
          logged_in: true,
          medecin: current_medecin
      }
    else
      render json: {
          logged_in: false,
          message: 'no such medecin'
      }
    end
  end
  def destroy
    logout!
    render json: {
        status: 200,
        logged_out: true
    }
  end
  private
  def session_params
    params.require(:medecin).permit(:email, :password)
  end
end

