class Storage < ApplicationRecord

  has_many :items, dependent: :destory
  has_many :favorites, dependent: :destory
  belongs_to :user

end
