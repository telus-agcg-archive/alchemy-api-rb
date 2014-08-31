require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, 'targeted_sentiment_analysis' do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  let(:keyphrase) { 'alchemyapi' }

  subject { AlchemyAPI::TargetedSentimentAnalysis.new }

  describe '#search' do
    {
      text: 'AlchemyAPI is cool',
      html: '<html><body>AlchemyAPI is cool</body></html>',
      url:  'http://www.alchemyapi.com'
    }.each do |type, value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it 'returns an array of results' do
            cassette_name = "sentiment_targeted_#{type}_#{output_mode}_search"
            VCR.use_cassette(cassette_name) do
              result = subject.search(type => value, :target => keyphrase)

              result.must_be_instance_of Hash
            end
          end

          it 'includes the keyword text and relavence' do
            cassette_name = "sentiment_targeted_#{type}_#{output_mode}_search"
            VCR.use_cassette(cassette_name) do
              result = subject.search(type => value, :target => keyphrase)

              result['type'].wont_be_nil
              result['score'].wont_be_nil
            end
          end
        end
      end
    end
  end
end
