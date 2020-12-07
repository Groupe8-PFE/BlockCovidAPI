class Adresse < ApplicationRecord
  has_many :medecin
  has_many :etablissement
  has_many :citoyen
end
