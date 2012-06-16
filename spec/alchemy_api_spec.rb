require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI do
  subject() { AlchemyAPI }

  it "knows the alchemy api url" do
    AlchemyAPI::BASE_URL.must_be :==, "http://access.alchemyapi.com/calls/"
  end

  it "allows you to set the key directly" do
    AlchemyAPI.key = "xxxxxxxx"
  end

  describe Config do
    describe ".add_mode" do
      it "allows classes to register themselves" do
        class Foo
          AlchemyAPI::Config.add_mode :foo, self
        end

        AlchemyAPI::Config.modes[:foo].must_be :==, Foo
      end
    end

    describe ".output_mode" do
      after do
        AlchemyAPI.configure do |config|
          config.output_mode = :json
        end
      end

      it "allows output mode to be set" do
        AlchemyAPI.configure do |config|
          config.output_mode = :xml
        end

        AlchemyAPI.config.output_mode.must_be :==, :xml
      end

      it "errors on invalid output mode" do
        -> {
          AlchemyAPI.configure do |config|
            config.output_mode = :xls
          end
        }.must_raise AlchemyAPI::InvalidOutputMode
      end
    end
  end

  describe ".search" do
    it "needs an api key" do
      AlchemyAPI::Config.apikey = nil

      -> {
        AlchemyAPI.search(:keyword_extraction, :text => "foo")
      }.must_raise AlchemyAPI::InvalidAPIKey
    end

    it "needs a valid mode" do
      AlchemyAPI::Config.apikey = "xxxxxxxxxxx"

      -> {
        AlchemyAPI.search(:foo, :text => "hello")
      }.must_raise AlchemyAPI::InvalidSearchMode
    end
  end
end
