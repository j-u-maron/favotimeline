class Recommended < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :tag, presence: true, length: { maximum: 50 }
  
end
