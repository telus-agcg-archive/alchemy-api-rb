module AlchemyAPI
  class URLGetTargetedSentiment < Base
    Config.add_mode :url_get_targeted_sentiment, self

    def web_method
      "#{method_prefix}URLGetTargetedSentiment"
    end

    private

    def indexer
      "keywords"
    end
  end
end
