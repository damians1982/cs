require 'test_helper'

class InvoicesBuyControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get invoices_buy_list_url
    assert_response :success
  end

end
