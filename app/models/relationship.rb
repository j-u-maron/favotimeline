class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :block, class_name: "User"
end
