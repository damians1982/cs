require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Damianno", street: "krucza" , city: "łódź",
      postal_code: "199-100",nip: "00-000")
  end

  #postal_code value is incorrect and we have assert(NOT)
  #so the whole test will be true when valid? returns false
  test "postal code should be not valid - no1" do
    @company.postal_code = "a99-100"
      assert_not @company.valid?
  end

  test "postal code should be not valid - no2" do
    @company.postal_code = "99-100."
    assert_not @company.valid?
  end

  test "postal code should be not valid - no3" do
    @company.postal_code = "99-100-11-200"
    assert_not @company.valid?
  end

  test "postal code should be not valid - no4" do
    @company.postal_code = "99-1000"
    assert_not @company.valid?
  end

  test "postal code should be not valid - no5" do
    @company.postal_code = "000-000"
    assert_not @company.valid?
  end

  test "postal code should be not valid - no6" do
    @company.postal_code = "0000-000"
    assert_not @company.valid?
  end

  test "nip or pesel should not be valid - no1" do
    @company.postal_code = "91-502"
    @company.nip = "a5070048492"
    assert_not @company.valid?
  end

  test "nip or pesel should not be valid - no2" do
    @company.postal_code = "91-502"
    @company.nip = "a12345678901"
    assert_not @company.valid?
  end

  test "nip or pesel should not be valid - no3" do
    @company.postal_code  = "91-502"
    @company.nip = ".1234567890"
    assert_not @company.valid?
  end

  test "nip or pesel should not be valid - no4" do
    @company.postal_code = "91-502"
    @company.nip = "-123.45678901"
    assert_not @company.valid?
  end

  test "nip or pesel should not be valid - no5" do
    @company.postal_code = "91-502"
    @company.nip = "12d1234567890"
    assert_not @company.valid?
  end

  test "nip or pesel should not be valid - no6" do
    @company.postal_code = "91-502"
    @company.nip = "123456789abcd12345678901"
    assert_not @company.valid?
  end
end
