class Property < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
    validates :name, length: { maximum: 255}
end
