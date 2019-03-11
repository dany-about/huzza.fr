class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  has_many :proofs
end
