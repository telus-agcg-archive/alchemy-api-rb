module AlchemyAPI
  class KeywordExtraction < Base
    def text_search(text, opts = {})
      search(:text, { text: text }, opts)["keywords"]
    end

    def web_method
      "TextGetRankedKeywords"
    end
  end
end
