module AlchemyAPI
  class EmotionAnalysis < Base
    Config.add_mode :emotion_analysis, self

    def web_method
      "#{method_prefix}GetEmotion"
    end

    private

    def indexer
      "docEmotions"
    end
  end
end
