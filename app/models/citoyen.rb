class Citoyen < ApplicationRecord
  belongs_to :adresse, optional: true
  has_many :scan_lieus
  has_many :scan_medecins
  validates :device_id, uniqueness: true
end
