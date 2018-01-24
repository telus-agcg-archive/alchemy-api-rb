module AlchemyAPI
  class TitleExtraction < Base
    Config.add_mode :title_extraction, self

    def web_method
      "#{method_prefix}GetTitle"
    end

    private

    def supported_search_types
      %i(url html)
    end

    def indexer
      'title'
    end
  end
end
