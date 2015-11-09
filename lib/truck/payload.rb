module Truck
  class Payload
    attr_reader :parcels

    def initialize
      @parcels ||= Truck.configuration.parcels
    end

    def add(parcel)
      parcels << parcel
      self
    end

    def deliver(message)
      parcels.each_with_object([]) do |parcel, acc|
        extend(parcel)
        acc << drop_off(message)
      end
    end
  end
end
