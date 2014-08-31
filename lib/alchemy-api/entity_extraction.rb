module AlchemyAPI
  class EntityExtraction < Base
    Config.add_mode :entity_extraction, self

    def web_method
      "#{method_prefix}GetRankedNamedEntities"
    end

    private

    def indexer
      'entities'
    end
  end
end
