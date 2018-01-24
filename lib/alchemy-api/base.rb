require 'json/ext'
require 'faraday'

module AlchemyAPI
  class Base
    attr_accessor :options, :response

    def search(opts)
      check_options(opts)
      body = { apikey: Config.apikey }.merge!(merged_options(options))

      @response = connection.post(path, body)

      parsed_response
    end

    def parsed_response
      case Config.output_mode
      when :json
        parsed = JSON.parse(@response.body)
        indexer ? parsed[indexer] : parsed
      when :rdf, :xml
        raise NotImplementedError
      end
    end

    def merged_options(opts)
      opts.merge(Config.default_options)
    end

    private

    def check_options(opts)
      @options = opts

      raise MissingOptionsError unless options && options.keys
      raise UnsupportedSearchMode unless supported_search_types.include?(mode)
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |builder|
        builder.request :url_encoded
        builder.adapter :excon
      end
    end

    def supported_search_types
      %i(text url html)
    end

    def mode
      %i(text url html).each do |type|
        return type if options.keys && options.keys.include?(type)
      end

      raise MissingOptionsError
    end

    def method_prefix
      case mode
      when :text then 'Text'
      when :url  then 'URL'
      when :html then 'HTML'
      end
    end

    def path
      "#{mode}/#{web_method}"
    end
  end
end
