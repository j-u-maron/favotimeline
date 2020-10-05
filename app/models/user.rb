class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :recommendeds
  has_many :relationships
  has_many :blockings, through: :relationships, source: :block
  has_many :raverses_of_ralationships, class_name: "Relationship", foreign_key: "block_id"
  has_many :blockers, through: :reverses_of_ralationship, source: :user
  
  def block(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(block_id: other_user.id)
    end
  end
  
  def unblock(other_user)
    relationship = self.relationships.find_by(block_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def blocking?(other_user)
    self.blockings.include?(other_user)
  end
  
  def feed_recommendeds
    Recommended.where.not(user_id: self.blocking_ids)
  end
end