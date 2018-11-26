class Chapter < ApplicationRecord
  validates :title, presence: true
  
  has_many :recipes
end
