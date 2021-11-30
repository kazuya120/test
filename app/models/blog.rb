class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user

  attachment :image
  
  include JpPrefecture
  jp_prefecture :prefecture_code
  validates :prefecture_code, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
