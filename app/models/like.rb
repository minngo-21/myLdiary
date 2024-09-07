class Like < ApplicationRecord
  belongs_to :language
  belongs_to :user
  validates_uniqueness_of :language_id, scope: :user_id
end
