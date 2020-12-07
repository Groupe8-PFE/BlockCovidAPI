class ApplicationController < ActionController::API
  private

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_medecin
    @_current_medecin ||= session[:current_medecin_id] &&
      Medecin.find_by(id: session[:current_medecin_id])
  end

end
