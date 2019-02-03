require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  def setup
    @property = Property.new(name: "Kamienica przy Kościuszki 31",regnum: "19",info: "Moja kamienica")
  end
  test "should be valid" do
     assert @property.valid?
  end
end
