require 'test_helper'

class TestPayload < Minitest::Test
  module Parcel
    def drop_off(value)
      value
    end
  end

  module B
    def drop_off(value)
      value + '!!'
    end
  end

  def setup
    Truck.configure do |config|
      config.parcels = [Parcel]
    end
  end

  def test_payload_parcels
    payload = Truck::Payload.new
    assert_equal(payload.parcels, [Parcel])
  end

  def test_payload_empty_parcels
    Truck.configure do |config|
      config.parcels = nil
    end

    payload = Truck::Payload.new
    assert_equal(payload.parcels, [])
  end

  def test_payload_add
    payload = Truck::Payload.new
    payload.add(B).add(Parcel)
    assert_equal(payload.parcels, [Parcel,B,Parcel])
  end

  def test_deliver_drops_off_single_parcel
    payload = Truck::Payload.new
    assert_equal(payload.deliver('hi'), ['hi'])
  end

  def test_deliver_drops_off_multiple_parcels
    payload = Truck::Payload.new
    payload.add(B)
    assert_equal(payload.deliver('hi'), ['hi', 'hi!!'])
  end
end
