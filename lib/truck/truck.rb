require 'faraday'

module Truck
  def agent
    @agent ||= Agent.new
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
    attr_accessor :host, :agent
  end
  
  class Agent   
    def deliver agent = {}, payload = {}
      connection.post "", agent.merge(payload)
    end

    def connection
      @connection ||= Faraday.new(:url => "http://#{Truck.configuration.host}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
  
end
