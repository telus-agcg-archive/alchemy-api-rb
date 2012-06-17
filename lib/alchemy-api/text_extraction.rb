module AlchemyAPI
  class TextExtraction < Base
    Config.add_mode :text_extraction, self

    def web_method
      "#{method_prefix}GetText"
    end

    private

    def indexer
      "text"
    end
  end
end
