class ItemComment < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :name, presence:true
  validates :user_id, presence:true

end
