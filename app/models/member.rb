class Member < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  validates :name, presence:true
  
end
