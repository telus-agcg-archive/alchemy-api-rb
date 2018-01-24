module AlchemyAPI
  class TextExtraction < Base
    Config.add_mode :text_extraction, self

    def web_method
      "#{method_prefix}GetText"
    end

    private

    def supported_search_types
      %i(url html)
    end

    def indexer
      'text'
    end
  end
end
