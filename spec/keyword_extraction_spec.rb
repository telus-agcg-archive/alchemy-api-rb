require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, "keyword_extraction" do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject() { AlchemyAPI::KeywordExtraction.new }

  it "sets it's web method as expected" do
    subject.web_method.must_be :==, "TextGetRankedKeywords"
  end

  describe "#search" do
    it "returns a an array of results" do
      VCR.use_cassette('basic_search') do
        result = subject.search(:text => "lorem ipsum")

        result.must_be_instance_of Array
      end
    end

    it "includes the keyword text and relavence" do
      VCR.use_cassette('basic_search') do
        result = subject.search(:text => "lorem ipsum")[0]
        [{"text"=>"lorem ipsum", "relevance"=>"0.993164"}]

        result["text"].wont_be_nil
        result["relevance"].wont_be_nil
      end
    end
  end
end
