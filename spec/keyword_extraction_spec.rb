require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, "keyword_extraction" do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject() { AlchemyAPI::KeywordExtraction.new }

  it "requires options to be set that include search type" do
    -> { subject.web_method }.must_raise AlchemyAPI::MissingOptionsError
  end

  describe "#search" do
    describe "text search" do
      it "returns an array of results" do
        VCR.use_cassette('basic_text_search') do
          result = subject.search(:text => "lorem ipsum")

          result.must_be_instance_of Array
        end
      end

      it "includes the keyword text and relavence" do
        VCR.use_cassette('basic_text_search') do
          result = subject.search(:text => "lorem ipsum")[0]

          result["text"].wont_be_nil
          result["relevance"].wont_be_nil
        end
      end
    end

    describe "html search" do
      let(:html) { "<html><body>foo bar</body></html>" }

      it "returns an array of results" do
        VCR.use_cassette('basic_html_search') do
          result = subject.search(:html => html)

          result.must_be_instance_of Array
        end
      end

      it "includes the keyword text and relavence" do
        VCR.use_cassette('basic_html_search') do
          result = subject.search(:html => html)[0]

          result["text"].wont_be_nil
          result["relevance"].wont_be_nil
        end
      end
    end
  end
end
