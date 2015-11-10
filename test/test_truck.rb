require 'test_helper'

class TestTruck < Minitest::Test

  class Dummy
    include Truck
  end

  def setup
    Truck.configure do |config|
      config.analytics = { :send => 'me' }
    end
  end

  def test_configure
    assert_equal(Truck.configuration.analytics, { :send => 'me' })
  end

  def test_payload
    assert_instance_of Truck::Payload, Dummy.new.payload
  end
end
