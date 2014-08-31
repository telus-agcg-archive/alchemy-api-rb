module AlchemyAPI
  class RelationExtraction < Base
    Config.add_mode :relation_extraction, self

    def web_method
      "#{method_prefix}GetRelations"
    end

    private

    def indexer
      'relations'
    end
  end
end
