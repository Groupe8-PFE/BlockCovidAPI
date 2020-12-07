class Etablissement < ApplicationRecord
  belongs_to :adresse

  #attr_accessor :mot_de_passe
  #validates :nom_etablissement, :presence => true, :uniqueness => true
  #before_save :encrypt_password

  #def encrypt_password
  #self.mot_de_passe_salt = BCrypt::Engine.generate_salt
  #self.mot_de_passe_hash = BCrypt::Engine.hash_secret(mot_de_passe,mot_de_passe_salt)
  #end

  #def self.authenticate(nom_etablissement, mot_de_passe)
  #etablissement = Etablissement.find_by "nom_etablissement = ?", nom_etablissement
  #if etablissement && etablissement.mot_de_passe_hash == BCrypt::Engine.hash_secret(mot_de_passe, etablissement.mot_de_passe_salt)
  # etablissement
  # else
  # nil
  #end
  #end
end
