class Company < ApplicationRecord
  #Class represents tenants who have lease agreement in tenement house

  validates :name,:street,:city,:postal_code,:nip, presence: true
  validates :nip, uniqueness: true

  VALID_POSTAL_CODE_REGEX = /\A\d\d-\d\d\d\z/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }

  VALID_NIP_OR_PESEL = /\A\d{10,11}\z/
  validates :nip, format: {with: VALID_NIP_OR_PESEL}
end
