class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :languages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_languages, through: :likes, source: :language
  def already_liked?(language)
    self.likes.exists?(language_id: language.id)
  end
end
