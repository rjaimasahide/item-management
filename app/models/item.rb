class Item < ApplicationRecord

  has_many :item_comments, dependent: :destroy
  belongs_to :storage

  #order_as_specifiedをつかうための記述
  extend OrderAsSpecified

  has_one_attached :image_id

  validates :name, presence:true
  validates :storage_id, presence:true

  #検索機能
  def self.looks(word)
    @item = Item.where("name LIKE?","%#{word}%")
  end

  #deadline(期限)までの日数
  def period
    if self.deadline == nil
      nil
    else
      (self.deadline - Date.current).to_i
    end
  end

  #並び替え機能
  def self.list(order, storage_id)
    if order == "latest_order"  #期限順
      items = Item.where(storage_id: storage_id, deleted_at: false)
      #期限が設定されているアイテムを取得し、並び替えて配列化
      deadline_items = items.where.not(deadline: nil).order(:deadline).to_a
      #期限が設定されていないアイテムを取得し配列化
      nil_items = items.where(deadline: nil).to_a
      #期限があるアイテムの配列の後ろに期限がないアイテムの配列を結合
      deadline_order = deadline_items + nil_items
      #結合した配列のアイテムを順番通りに再取得
      @items = Item.where(id: deadline_order).order_as_specified(id: deadline_order)
      
    elsif order == "updated_at_order"  #更新日順
      item = Item.where(storage_id: storage_id, deleted_at: false)
      @items = item.order(:updated_at)
      
    elsif order == "purchase_status_order"  #買うもの優先
      items = Item.where(storage_id: storage_id, deleted_at: false)
      @items = items.order(purchase_status: :DESC)
      
    elsif order == "name_order"  #名前順
      items = Item.where(storage_id: storage_id, deleted_at: false)
      @items = items.order(:name)
      
    else  #その他
      @items = Item.where(storage_id: storage_id, deleted_at: false)
    end
  end

  def get_image_id
      (image_id.attached?) ? image_id : 'no_image.jpg'
  end

end