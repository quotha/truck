module Truck
  module Analytics
    def drop_off(contents)
      connection.post "", Truck.configuration.analytics.merge(contents)
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
