require "alchemy-api/version"
require "alchemy-api/config"
require "alchemy-api/base"
require "alchemy-api/keyword_extraction"
require "alchemy-api/text_extraction"
require "alchemy-api/title_extraction"
require "alchemy-api/entity_extraction"
require "alchemy-api/sentiment_analysis"
require "alchemy-api/targeted_sentiment_analysis"
require "alchemy-api/relation_extraction"
require "alchemy-api/concept_tagging"
require "alchemy-api/text_categorization"
require "alchemy-api/language_detection"
require "alchemy-api/author_extraction"
require "alchemy-api/taxonomy"
require "alchemy-api/image_tagging"

module AlchemyAPI
  BASE_URL = "http://access.alchemyapi.com/calls/"

  def self.config
    Config
  end

  def self.configure
    block_given? ? yield(Config) : Config
  end

  def self.key
    Config.apikey
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
