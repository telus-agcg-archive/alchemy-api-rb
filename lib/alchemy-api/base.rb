require 'json/ext'
require 'faraday'

module AlchemyAPI
  class Base
    attr_accessor :options, :response

    def search(opts)
      check_options(opts)

      @response = connection.post(path, construct_body)

      parsed_response
    end

    def parsed_response
      case Config.output_mode
      when :json
        parsed = JSON.parse(@response.body)
        indexer ? parsed[indexer] : parsed
      when :xml
      when :rdf
        raise NotImplementedError.new
      end
    end

    def merged_options(opts)
      opts.merge(Config.default_options)
    end

    private

    def check_options(opts)
      @options = opts

      raise MissingOptionsError.new unless options && options.keys

      unless supported_search_types.include?(mode)
        raise UnsupportedSearchMode.new
      end
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL)
    end

    def supported_search_types
      [:text, :url, :html]
    end

    def mode
      [:text, :url, :html].each do |type|
        return type if options.keys && options.keys.include?(type)
      end

      raise MissingOptionsError.new
    end

    def method_prefix
      case mode
      when :text then "Text"
      when :url then "URL"
      when :html then "HTML"
      end
    end

    def path
      "#{mode}/#{web_method}"
    end

    def construct_body
      body = { apikey: Config.apikey }.merge!(merged_options(options))

      body.map { |e| e.join('=') }.join('&')
    end
  end
end

