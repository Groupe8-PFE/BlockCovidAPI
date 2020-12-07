class Adresse < ApplicationRecord
  has_one :medecin
  has_one :etablissement
  has_one :citoyen
end
