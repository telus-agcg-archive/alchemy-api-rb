module AlchemyAPI
  class ImageSceneText < Base
    Config.add_mode :image_scene_text, self

    def web_method
      "#{method_prefix}GetRankedImageSceneText"
    end

    private

    def supported_search_types
      [:url]
    end

    def indexer
      'sceneTextLines'
    end
  end
end
