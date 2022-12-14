class User < ApplicationRecord
  has_many :pets
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  before_update :admin_cannot_update
  before_destroy :admin_cannot_delete

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    unless self == other_user
     active_relationships.find_by(followed_id: other_user.id).destroy
   end
  end

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def admin_cannot_update
    throw :abort if User.where(admin: true).count == 1 && self.admin_change == [true, false]
  end

  def admin_cannot_delete
    throw :abort if User.where(admin: true).count == 1 && self.admin == true
  end
end
