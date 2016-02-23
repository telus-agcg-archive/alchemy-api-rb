require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, 'face_detection' do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject { AlchemyAPI::FaceDetection.new }

  describe '#search' do
    {
      url: 'http://vision.alchemy.ai/img/demo/5682349.jpg'
    }.each do |type, value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it 'returns an array of results' do
            cassette_name = "face_detection_basic_#{type}_#{output_mode}_search"
            VCR.use_cassette(cassette_name) do
              result = subject.search(type => value)

              result.must_be_instance_of Array
            end
          end

          it 'includes the keyword text and score' do
            cassette_name = "face_detection_basic_#{type}_#{output_mode}_search"
            VCR.use_cassette(cassette_name) do
              result = subject.search(type => value)[0]

              result['age'].wont_be_nil
              result['gender'].wont_be_nil
              result['identity'].wont_be_nil
              result['positionX'].wont_be_nil
              result['positionY'].wont_be_nil
              result['width'].wont_be_nil
            end
          end
        end
      end
    end
  end
end
