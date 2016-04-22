module AlchemyAPI
  class CombinedCall < Base
    Config.add_mode :combined_call, self

    def web_method
      "#{method_prefix}GetCombinedData"
    end

    private

    def indexer
      nil
    end
  end
end
