class Medecin < ApplicationRecord
  belongs_to :adresse
  has_secure_password
  #attr_accessor :password
  #validates :email, :presence => true, :uniqueness => true
  #before_save :encrypt_password

  #def encrypt_password
  #self.mot_de_passe_salt = BCrypt::Engine.generate_salt
  #self.mot_de_passe_hash = BCrypt::Engine.hash_secret(mot_de_passe,mot_de_passe_salt)
  #end

  #def self.authenticate(email, mot_de_passe)
  #medecin = Medecin.find_by "email = ?", email
  #if medecin && medecin.mot_de_passe_hash == BCrypt::Engine.hash_secret(mot_de_passe, medecin.mot_de_passe_salt)
  #medecin
  #else
  #   nil
  # end
  #end
end
