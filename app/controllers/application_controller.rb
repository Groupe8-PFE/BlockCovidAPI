class ApplicationController < ActionController::API

  include ActionController::Helpers

  #skip_before_action :verify_authenticity_token
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  #
  #
  helper_method :login!, :logged_in?, :current_medecin, :authorized_medecin?, :logout!, :set_medecin
  def login!
    session[:medecin_id] = @medecin.id
  end

  def logged_in?
    !!session[:medecin_id]
  end

  def current_medecin
    @current_medecin ||= session[:current_medecin_id] && Medecin.find_by(id: session[:current_medecin_id])
  end

  def authorized_user?
    @medecin == current_medecin
  end
  def logout!
    session.clear
  end
  def set_user
    @medecin = Medecin.find_by(id: session[:medecin_id])
  end

end
