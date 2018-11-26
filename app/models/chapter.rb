class Chapter < ApplicationRecord
  validates :title, presence: true
  
  has_many :recipes
  accepts_nested_attributes_for :recipes 
end
