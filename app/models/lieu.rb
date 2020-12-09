class Lieu < ApplicationRecord
  belongs_to :etablissement
  has_many :scan_lieus
end
