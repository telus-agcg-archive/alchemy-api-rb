module AlchemyAPI
  class Taxonomy < Base
    Config.add_mode :taxonomy, self

    def web_method
      "#{method_prefix}GetRankedTaxonomy"
    end

    private

    def indexer
      'taxonomy'
    end
  end
end
