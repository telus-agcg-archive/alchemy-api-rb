module AlchemyAPI
  class ImageTagging < Base
    Config.add_mode :image_tagging, self

    def web_method
      "#{method_prefix}GetRankedImageKeywords"
    end

    private

    def supported_search_types
      [:url]
    end

    def indexer
      "imageKeywords"
    end
  end
end
