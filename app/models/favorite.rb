class Favorite < ApplicationRecord

  belongs_to :storage

  has_one_attached :image_id

  validates :name, presence:true
  validates :storage_id, presence:true
  validates :amount, presence:true

  def get_image_id
      (image_id.attached?) ? image_id : 'no_image.jpg'
  end
end
