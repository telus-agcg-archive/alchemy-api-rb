require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, 'emotion_analysis' do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject { AlchemyAPI::EmotionAnalysis.new }

  describe '#search' do
    {
      text: 'Google is a large company',
      html: '<html><body>Google is a large company</body></html>',
      url: 'http://www.alchemy.com'
    }.each do |type, value|
      [:json].each do |mode|
        before do
          AlchemyAPI::Config.output_mode = mode
        end

        describe "#{type} search with #{mode} results" do
          it 'returns a hash of results' do
            VCR.use_cassette("emotion_analysis_call_basic_#{type}_#{mode}_search") do
              result = subject.search(type => value)

              result.must_be_instance_of Hash
            end
          end

          it 'includes the keyword docEmotions' do
            VCR.use_cassette("emotion_analysis_call_basic_#{type}_#{mode}_search") do
              result = subject.search(type => value)

              result['anger'].wont_be_nil
              result['disgust'].wont_be_nil
              result['fear'].wont_be_nil
              result['joy'].wont_be_nil
              result['sadness'].wont_be_nil
            end
          end
        end
      end
    end
  end
end
