class Company < ApplicationRecord
  validates :name,:street,:city,:postal_code,:nip, presence: true
  validates :nip, uniqueness: true

  VALID_POSTAL_CODE_REGEX = /\d\d-\d\d\d/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }

  #VALID_NIP_OR_PESEL = /(\d\d\d\d\d\d\d\d\d\d)|(\d\d\d\d\d\d\d\d\d\d\d)/
  #VALID_NIP_OR_PESEL = /\d{10}/

  #validates :nip, format: {with: VALID_NIP_OR_PESEL}
end
