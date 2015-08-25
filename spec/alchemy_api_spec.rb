require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI do
  subject { AlchemyAPI }

  it 'knows the secure alchemy api url' do
    AlchemyAPI::BASE_URL.must_be :==, 'https://access.alchemyapi.com/calls/'
  end

  it 'allows you to set the key directly' do
    key = 'xxxxxxxx'
    AlchemyAPI.key = key

    AlchemyAPI.key.must_be :==, key
  end

  describe AlchemyAPI::Config do
    describe '.add_mode' do
      it 'allows classes to register themselves' do
        class Foo
          AlchemyAPI::Config.add_mode :foo, self
        end

        AlchemyAPI::Config.modes[:foo].must_be :==, Foo
      end
    end

    describe '.output_mode' do
      after do
        AlchemyAPI.configure do |config|
          config.output_mode = :json
        end
      end

      it 'allows output mode to be set' do
        AlchemyAPI.configure do |config|
          config.output_mode = :xml
        end

        AlchemyAPI.config.output_mode.must_be :==, :xml
      end

      it 'errors on invalid output mode' do
        lambda do
          AlchemyAPI.configure do |config|
            config.output_mode = :xls
          end
        end.must_raise AlchemyAPI::InvalidOutputMode
      end
    end
  end

  describe '.search' do
    it 'needs an api key' do
      AlchemyAPI::Config.apikey = nil

      lambda do
        AlchemyAPI.search(:keyword_extraction, text: 'foo')
      end.must_raise AlchemyAPI::InvalidAPIKey
    end

    it 'needs a valid mode' do
      AlchemyAPI::Config.apikey = 'xxxxxxxxxxx'

      lambda do
        AlchemyAPI.search(:bar, text: 'hello')
      end.must_raise AlchemyAPI::InvalidSearchMode
    end
  end
end
