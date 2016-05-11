require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, 'image_scene_text' do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject { AlchemyAPI::ImageSceneText.new }

  describe '#search' do
    {
      url: 'https://www.scenicwonders.com/wp-content/uploads/2011/03/Yosemite-National-Park-sign-by-Acradenia.jpg'
    }.each do |type, value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it 'returns an array of results' do
            cassette_name = "image_scene_text_basic_#{type}_#{output_mode}_search"
            VCR.use_cassette(cassette_name) do
              result = subject.search(type => value)

              result.must_be_instance_of Array
            end
          end

          it 'includes the keyword text, words and confidence' do
            cassette_name = "image_scene_text_basic_#{type}_#{output_mode}_search"
            VCR.use_cassette(cassette_name) do
              result = subject.search(type => value)[0]

              result['text'].wont_be_nil
              result['words'].wont_be_nil
              result['confidence'].wont_be_nil
            end
          end
        end
      end
    end
  end
end
