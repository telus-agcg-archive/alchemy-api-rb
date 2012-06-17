require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI, "author_extraction" do
  before do
    AlchemyAPI::Config.apikey = API_KEY
  end

  subject() { AlchemyAPI::AuthorExtraction.new }

  describe "#search" do
    {
      :html => "<html><body>Google is a large, by Joe Smith</body></html>",
      :url => "http://blog.alchemyapi.com/"
    }.each do |type,value|
      [:json].each do |output_mode|
        before do
          AlchemyAPI::Config.output_mode = output_mode
        end

        describe "#{type} search with #{output_mode} results" do
          it "returns an array of results" do
            VCR.use_cassette("author_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)

              result.must_be_instance_of Hash
            end
          end

          it "includes the keyword text and relavence" do
            VCR.use_cassette("author_basic_#{type}_#{output_mode}_search") do
              result = subject.search(type => value)

              result["author"].wont_be_nil
            end
          end
        end
      end
    end
  end
end



