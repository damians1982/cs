require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  def setup
    @property1 = Property.new(name: "Kamienica przy Kościuszki 31",regnum: "19",info: "Moja kamienica")
    @property2 = Property.new
  end

  test "should be valid" do
     assert @property1.valid?
  end

  test "name must be given" do
    assert_not @property2.valid?
  end

  test "name cannot be empty string, even with few white spaces" do
    @tmp = Property.new()
    @tmp.name = "    "
    assert_not @tmp.valid?
  end

  test "cannot save two objects with same name, name must be unique" do
    @tmp1 = Property.new
    @tmp1.name = 'name1'
    @result1 = @tmp1.save

    @tmp2 = Property.new
    @tmp2.name = 'name1'
    @result2 = @tmp2.save

    assert_not_equal(@result1,@result2)  

  end
end
