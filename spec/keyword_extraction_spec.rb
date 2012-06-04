require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI::KeywordExtraction do
  subject() { AlchemyAPI::KeywordExtraction.new API_KEY }

  it "sets it's web method as expected" do
    subject.web_method.must_be :==, "TextGetRankedKeywords"
  end

  describe "#text_search" do
    it "optionally accepts options" do
      -> do
        AlchemyAPI::KeywordExtraction.stub :search, "", "" do
          subject.text_search("text")
          subject.text_search("text", {})
        end
      end #.wont_raise # no wont_raise?
    end

    it "returns a an array of results" do
      result = subject.text_search("lorem ipsum")

      result.must_be_instance_of Array
    end
  end
end
