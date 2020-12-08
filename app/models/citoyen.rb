class Citoyen < ApplicationRecord
  belongs_to :adresse, optional: true
end
