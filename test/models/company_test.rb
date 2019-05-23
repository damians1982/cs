require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Damianno", street: "krucza" , city: "łódź", postal_code: "99-100", nip: "00-000")
  end

  test "should be valid" do
    assert @company.valid?
  end
end
