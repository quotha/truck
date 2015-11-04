require 'faraday'

module Truck
  def payload
    @payload ||= Payload.new
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :host, :payload
  end

  class Payload
    def deliver(dp = "/")
      conn = Faraday.new(:url => "http://#{Truck.configuration.host}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      conn.post "", Truck.configuration.payload.merge({ :dp => dp })
    end
  end
end
