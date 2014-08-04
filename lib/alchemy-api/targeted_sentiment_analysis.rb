module AlchemyAPI
  class TargetedSentimentAnalysis < Base
    Config.add_mode :targeted_sentiment_analysis, self

    def web_method
      "#{method_prefix}GetTargetedSentiment"
    end

    private

    def indexer
      "docSentiment"
    end
  end
end
