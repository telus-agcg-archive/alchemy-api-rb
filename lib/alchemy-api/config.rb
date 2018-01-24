module AlchemyAPI
  class Config
    class << self
      attr_accessor :apikey
      attr_accessor :modes
    end

    def self.add_mode(key, klass)
      @modes ||= {}

      @modes[key] = klass
    end

    def self.default_options
      {
        outputMode: output_mode
      }
    end

    def self.output_mode
      @output_mode || :json
    end

    def self.output_mode=(value)
      raise InvalidOutputMode unless valid_output_modes.include?(value.to_s)

      @output_mode = value
    end

    def self.valid_output_modes
      ['xml', 'json', 'rdf', 'rel-tag', 'rel-tag-raw']
    end
  end
end
