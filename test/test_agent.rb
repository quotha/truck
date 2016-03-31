require 'test_helper'

class TestSmartDeliver < Minitest::Test
  def setup
    Truck.configure do |config|
      config.host = '0.0.0.0'
      config.agent = { :google => {:send => 'me'}, :moon => {:rocket => 'X1'} }
    end
  end
  
  def test_deliver
    mock = Minitest::Mock.new
    mock.expect :post, true do |arg1, arg2|
      assert_equal arg2, { :rocket => 'X1', :passenger => 'George' }
    end

    agent = Truck::Agent.new
    agent.stub :connection, mock do
      assert_equal agent.deliver(Truck.configuration.agent[:moon], {:passenger => 'George'}), true
    end    
  end

end
