class Language < ApplicationRecord
  belongs_to :user 
  has_many :language_tag_relations, dependent: :destroy
  has_many :tags, through: :language_tag_relations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end

