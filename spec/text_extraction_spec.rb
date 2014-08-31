require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, 'text_extraction' do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject { AlchemyAPI::TextExtraction.new }

  describe '#search' do
    {
      html: '<html><body>foo bar</body></html>',
      url: 'http://www.google.com'
    }.each do |type, value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it 'returns an array of results' do
            VCR.use_cassette("text_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)

              result.must_be_instance_of String
            end
          end
        end
      end
    end
  end
end
