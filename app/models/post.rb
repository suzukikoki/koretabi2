class Post < ApplicationRecord
  has_one_attached :image
  
  belongs_to :category
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  validates :category_id, presence: true
  validates :image, presence: true
  validates :place, presence: true
  validates :description, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
