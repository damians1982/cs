class Company < ApplicationRecord
  validates :name,:street,:city,:postal_code,:nip, presence: true
end
