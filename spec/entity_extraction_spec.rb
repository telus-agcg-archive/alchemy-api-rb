require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, 'entity_extraction' do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject { AlchemyAPI::EntityExtraction.new }

  describe '#search' do
    {
      text: 'Google is a large company',
      html: '<html><body>Google is a large company</body></html>',
      url: 'http://www.google.com'
    }.each do |type, value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it 'returns an array of results' do
            VCR.use_cassette("entity_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)

              result.must_be_instance_of Array
            end
          end

          it 'includes the keyword text and relavence' do
            VCR.use_cassette("entity_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)[0]

              result['text'].wont_be_nil
              result['type'].wont_be_nil
              result['count'].wont_be_nil
              result['relevance'].wont_be_nil
            end
          end
        end
      end
    end
  end
end
