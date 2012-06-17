require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, "text_categorization" do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject() { AlchemyAPI::TextCategorization.new }

  describe "#search" do
    {
      :text => "lorem ipsum",
      :url => "http://www.alchemyapi.com/"
    }.each do |type,value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it "returns an array of results" do
            VCR.use_cassette("category_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)

              result.must_be_instance_of Hash
            end
          end

          it "includes the keyword text and relavence" do
            VCR.use_cassette("category_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)

              result["url"].wont_be_nil
              result["category"].wont_be_nil
              result["score"].wont_be_nil
            end
          end
        end
      end
    end
  end
end

