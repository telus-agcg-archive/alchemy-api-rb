require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe AlchemyAPI::Base do
  subject { AlchemyAPI::Base.new }

  describe '#connection' do
    it 'creates a connection' do
      subject.send(:connection).wont_be_nil
    end

    describe '#adapter' do
      it 'uses the excon adapter' do
        subject
          .send(:connection)
          .builder
          .handlers
          .must_include Faraday::Adapter::Excon
      end
    end
  end

  describe '#merge_options' do
    it 'combines default options with user provided' do
      opts = { extra: 'extra' }
      expected = { outputMode: :json }.merge(opts)

      subject.merged_options(opts).must_be :==, expected
    end
  end
end
