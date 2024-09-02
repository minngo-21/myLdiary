class LanguageTagRelation < ApplicationRecord
  belongs_to :language
  belongs_to :tag
end
