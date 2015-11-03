require 'faraday'

module Truck

  def truck
    @truck ||= Truck.new
  end

  class Truck

    def self.ignition(destination, payload = {})
      @@destination, @@payload = destination, payload
    end

    def rev(dp = "/")
      conn = Faraday.new(:url => "http://#{@@destination}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      ## POST ##
      conn.post "", @@payload.merge({ :dp => dp })
    end
  end
end
