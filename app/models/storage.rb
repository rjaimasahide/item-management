class Storage < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

end
