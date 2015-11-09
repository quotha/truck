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
    attr_accessor :analytics, :parcels
  end
end
