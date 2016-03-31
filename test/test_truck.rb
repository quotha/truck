require 'test_helper'

class TestTruck < Minitest::Test

  class Dummy
    include Truck
  end

  def setup
    Truck.configure do |config|
      config.host = '0.0.0.0'
      config.agent = { :google => {:send => 'me'}, :moon => {:rocket => 'X1'} }
    end
  end

  def test_configure
    assert_equal(Truck.configuration.agent[:google], { :send => 'me' })
    assert_equal(Truck.configuration.host, '0.0.0.0')
  end
  
  def test_agent
    assert_instance_of Truck::Agent, Dummy.new.agent
  end
end
