class Member < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  belongs_to :member
  
end
