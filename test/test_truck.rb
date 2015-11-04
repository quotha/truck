require 'test_helper'

class TestTruck < Minitest::Test

  class Dummy
    include Truck
  end

  def setup
    Truck.configure do |config|
      config.host = '0.0.0.0'
      config.payload = { :send => 'me' }
    end
  end

  def test_configure
    assert_equal(Truck.configuration.payload, { :send => 'me' })
    assert_equal(Truck.configuration.host, '0.0.0.0')
  end
  
  def test_payload
    assert_instance_of Truck::Payload, Dummy.new.payload
  end
end
