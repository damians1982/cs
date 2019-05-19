class Company < ApplicationRecord
  validates :name,:street,:city,:postal_code,:nip, presence: true
  validates :nip, uniqueness: true

  VALID_POSTAL_CODE_REGEX = /\d\d-\d\d\d/

  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
end
