module AlchemyAPI
  class AuthorExtraction < Base
    Config.add_mode :author_extraction, self

    def web_method
      "#{method_prefix}GetAuthor"
    end

    private

    def supported_search_types
      [:html, :url]
    end

    def indexer
      nil
    end
  end
end
