require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, "keyword_extraction" do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject() { AlchemyAPI::KeywordExtraction.new }

  it "requires options to be set that include search type" do
    -> { subject.web_method }.must_raise AlchemyAPI::MissingOptionsError
  end

  # WTF?!?
  # let(:searches) do
  #   {
  #     :text => "lorem ipsum",
  #     :html => "<html><body>foo bar</body></html>"
  #   }
  # end

  describe "#search" do
    {
      :text => "lorem ipsum",
      :html => "<html><body>foo bar</body></html>",
      :url => "http://www.google.com"
    }.each do |type,value|
      describe "#{type} search" do
        it "returns an array of results" do
          VCR.use_cassette("basic_#{type}_search") do
            result = subject.search(type => value)

            result.must_be_instance_of Array
          end
        end

        it "includes the keyword text and relavence" do
          VCR.use_cassette("basic_#{type}_search") do
            result = subject.search(type => value)[0]

            result["text"].wont_be_nil
            result["relevance"].wont_be_nil
          end
        end
      end
    end
  end
end
