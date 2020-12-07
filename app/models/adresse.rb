class Adresse < ApplicationRecord
  belongs_to :medecin
  belongs_to :etablissement
  belongs_to :citoyen
end
