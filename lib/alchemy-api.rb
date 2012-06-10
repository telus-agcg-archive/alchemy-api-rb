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

  def key=(value)
    Config.apikey = value
  end

  def self.search(mode, opts)
    klass = Config.modes[mode]

    raise Exception unless Config.apikey
    raise Exception unless klass

    klass.new.search(opts)
  end
end
