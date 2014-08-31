module AlchemyAPI
  class LanguageDetection < Base
    Config.add_mode :language_detection, self

    def web_method
      "#{method_prefix}GetLanguage"
    end

    private

    def indexer
      nil
    end
  end
end
