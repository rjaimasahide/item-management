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

  #並び替え機能
  def self.list(order, storage_id)
    if order == "latest_order"
      items = Item.where(storage_id: storage_id, deleted_at: false)
      @items = items.order(:deadline)
    elsif order == "updated_at_order"
      item = Item.where(storage_id: storage_id, deleted_at: false)
      @items = item.order(:updated_at)
    elsif order == "purchase_status_order"
      items = Item.where(storage_id: storage_id, deleted_at: false)
      @items = items.order(purchase_status: :DESC)
    elsif order == "name_order"
      items = Item.where(storage_id: storage_id, deleted_at: false)
      @items = items.order(:name)
    else
      @items = Item.where(storage_id: storage_id, deleted_at: false)
    end
  end

  def get_image_id
      (image_id.attached?) ? image_id : 'no_image.jpg'
  end

end
