require 'test_helper'

class TestPayload < Minitest::Test
  def setup
    Truck.configure do |config|
      config.host = '0.0.0.0'
      config.payload = { :send => 'me' }
    end
  end

  def test_deliver_adds_payload
    mock = Minitest::Mock.new
    mock.expect :post, true do |arg1, arg2|
      assert_equal arg2, { :send => 'me', :me => 'too' }
    end

    payload = Truck::Payload.new
    payload.stub :connection, mock do
      assert_equal payload.deliver({:me => 'too'}), true
    end
  end

end
