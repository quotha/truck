require 'faraday'

module Truck
  class Truck
    attr_reader :host, :ep, :v, :t, :tid, :cid, :dp
  
    def initialize
      @host = "www.google-analytics.com"
      @ep   = "/collect"
      @v    = 1
      @t    = "pageview"
      @tid  = "UA-69585210-1"
      @cid  = "20454dc2-f1b4-4fe0-bead-013ad8895100"
      @dp   = "/"
    end
  
    def rev(dp = "/")
      conn = Faraday.new(:url => "http://#{host}") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    
      ## POST ##

      conn.post "#{ep}", { :v   => "#{v}", 
                           :t   => "#{t}",
                           :tid => "#{tid}",
                           :cid => "#{cid}",
                           :dp  => "#{dp}"
      }
    end
  end
end