class Tag < ApplicationRecord
  validates :name, presence: true
  
  has_many :language_tag_relations, dependent: :destroy
  has_many :languages, through: :language_tag_relations, dependent: :destroy
end
