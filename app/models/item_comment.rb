class ItemComment < ApplicationRecord

  belongs_to :member
  belongs_to :item

  validates :item_id, presence:true
  validates :member_id, presence:true

end
