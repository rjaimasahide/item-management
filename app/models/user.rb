class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :storages, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
