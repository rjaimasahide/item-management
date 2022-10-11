class Item < ApplicationRecord

  belongs_to :storage

  validates :name, presence:true
  validates :storage_id, presence:true
  validates :amount, presence:true

  def self.looks(word)
    @item = Item.where("name LIKE?","%#{word}%")
  end

end
