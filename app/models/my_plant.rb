class MyPlant < ApplicationRecord
  belongs_to :garden
  belongs_to :plant

  has_many :actions, dependent: :destroy
end
