module AlchemyAPI
  class SentimentAnalysis < Base
    Config.add_mode :sentiment_analysis, self

    def web_method
      "#{method_prefix}GetTextSentiment"
    end

    private

    def indexer
      'docSentiment'
    end
  end
end
