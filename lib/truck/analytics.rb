module Truck
  module Analytics
    def drop_off(parcel)
      connection.post "", Truck.configuration.analytics.merge(parcel)
    end

    private

    def connection
      @connection ||= Faraday.new(:url => "http://#{ Truck.configuration.analytics['host'] }") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end
