module AlchemyAPI
  class KeywordExtraction < Base
    Config.add_mode :keyword_extraction, self

    def search(opts)
      super(opts)["keywords"]
    end

    def web_method
      "#{method_prefix}GetRankedKeywords"
    end
  end
end
