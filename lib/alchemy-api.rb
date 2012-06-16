require "alchemy-api/version"
require "alchemy-api/config"
require "alchemy-api/base"
require "alchemy-api/keyword_extraction"

module AlchemyAPI
  BASE_URL = "http://access.alchemyapi.com/calls/"

  def self.config
    Config
  end

  def self.configure
    block_given? ? yield(Config) : Config
  end

  def self.key=(value)
    Config.apikey = value
  end

  def self.search(mode, opts)
    klass = Config.modes[mode]

    raise InvalidAPIKey.new unless Config.apikey
    raise InvalidSearchMode.new unless klass

    klass.new.search(opts)
  end

  class UnknownError < StandardError; end
  class MissingOptionsError < StandardError; end
  class InvalidAPIKey < StandardError; end
  class InvalidSearchMode < StandardError; end
  class InvalidOutputMode < StandardError; end
end
