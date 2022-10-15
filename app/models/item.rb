class Item < ApplicationRecord

  has_many :item_comments, dependent: :destroy
  belongs_to :storage

  has_one_attached :image_id

  validates :name, presence:true
  validates :storage_id, presence:true
  validates :amount, presence:true
  
  #検索機能
  def self.looks(word)
    @item = Item.where("name LIKE?","%#{word}%")
  end
  
  #deadline(期限)までの日数
  def period
    (self.deadline - Date.current).to_i
  end

  def get_image_id
      (image_id.attached?) ? image_id : 'no_image.jpg'
  end

end
