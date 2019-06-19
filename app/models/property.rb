class Property < ApplicationRecord
  #Class represents property we manage

  validates :name, presence: true
  validates :name, uniqueness: true
    validates :name, length: { maximum: 255}
end
