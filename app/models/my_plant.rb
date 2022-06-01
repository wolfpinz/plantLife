class MyPlant < ApplicationRecord
  belongs_to :garden
  belongs_to :plant

  has_many :actions, dependent: :destroy
  has_one_attached :photo
end
