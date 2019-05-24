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

end

  #test "nip should not be valid" do
  #  puts "putsuje"
  #  #characters appended at the end and beginning
  #  @company.nip ="a507-004-84-92v"
  #  assert_not @company.valid?
  #end

  #test "nip should not be valid2" do
  #  puts "putsuje"
  #  #characters appended at the end
  #  @company.nip ="507-004-84-92a"
  #  assert_not @company.valid?
  #end

  #test "nip should not be valid3" do
  #  puts "putsuje"
  #  #characters appended at the end
  #  @company.nip ="507-004-84-92."
  #  assert_not @company.valid?
  #end
