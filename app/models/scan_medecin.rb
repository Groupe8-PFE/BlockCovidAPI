class ScanMedecin < ApplicationRecord
  belongs_to :medecin
  belongs_to :citoyen
end
