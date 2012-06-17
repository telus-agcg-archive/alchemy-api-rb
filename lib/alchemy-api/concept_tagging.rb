module AlchemyAPI
  class ConceptTagging < Base
    Config.add_mode :concept_tagging, self

    def web_method
      "#{method_prefix}GetRankedConcepts"
    end

    private

    def indexer
      "concepts"
    end
  end
end

