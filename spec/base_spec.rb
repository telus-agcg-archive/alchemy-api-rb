require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI::Base do
  it "needs an api key" do
    -> { AlchemyAPI::Base.new }.must_raise ArgumentError
  end

  subject() { AlchemyAPI::Base.new "key" }

  describe "#connection" do
    it "knows the alchemy api url" do
      AlchemyAPI::BASE_URL.must_be :==, "http://access.alchemyapi.com/calls/"
    end
    it "creates a connection" do
      subject.send(:connection).wont_be_nil
    end
  end

  describe "#default_options" do
    it "has a default options hash" do
      subject.default_options.must_be_instance_of Hash
    end
  end

  describe "#merge_options" do
    it "combines default options with user provided" do
      params = { text: "text" }
      opts = { extra: "extra" }
      expected = { outputMode: :json }.merge(params).merge(opts)

      subject.merged_options(params, opts).must_be :==, expected
    end
  end
end
