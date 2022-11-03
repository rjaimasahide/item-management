class Member < ApplicationRecord

  has_many :item_comments, dependent: :destroy
  belongs_to :user

  validates :name, presence:true, length: {maximum: 20}

end
