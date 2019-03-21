class Video < ApplicationRecord
  has_one_attached :clip
  belongs_to :participation
end