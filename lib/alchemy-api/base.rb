require 'json/ext'
require 'faraday'

module AlchemyAPI
  BASE_URL = "http://access.alchemyapi.com/calls/"

  class Base
    def initialize(apikey)
      @apikey = apikey
    end

    def default_options
      {
        outputMode: :json
      }
    end

    def merged_options(params, opts = {})
      params.dup.tap do |merged|
        merged.merge!(opts)
        merged.merge!(default_options)
      end
    end

    private

    def connection
      @connection ||= Faraday.new(url: BASE_URL)
    end

    def apikey
      @apikey
    end

    def path(mode)
      "#{mode}/#{web_method}"
    end

    def search(mode, params, opts = {})
      body = construct_body(params, opts)

      result = connection.post(path(mode), body)

      JSON.parse(result.body)
    end

    def construct_body(params, opts = {})
      "".tap do |body|
        { apikey: @apikey }.merge!(merged_options(params, opts)).each do |k,v|
          body << "#{k}=#{v}&"
        end
      end
    end
  end
end

