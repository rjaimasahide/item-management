class Favorite < ApplicationRecord
  
  belongs_to :storage
  
  validates :name, presence:true
  validates :storage_id, presence:true
  validates :amount, presence:true
end
