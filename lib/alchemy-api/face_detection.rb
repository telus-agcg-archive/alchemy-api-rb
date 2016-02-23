module AlchemyAPI
  class FaceDetection < Base
    Config.add_mode :face_detection, self

    def web_method
      "#{method_prefix}GetRankedImageFaceTags"
    end

    private

    def supported_search_types
      [:url]
    end

    def indexer
      'imageFaces'
    end
  end
end
