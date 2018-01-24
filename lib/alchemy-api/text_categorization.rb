module AlchemyAPI
  class TextCategorization < Base
    Config.add_mode :text_categorization, self

    def web_method
      "#{method_prefix}GetCategory"
    end

    private

    def supported_search_types
      # TODO: fix html
      %i(text url)
    end

    def indexer
      nil
    end
  end
end
