class Chapter < ApplicationRecord
  validates :title, presence: true
  
  has_many :recipes, dependent: :destroy

end
