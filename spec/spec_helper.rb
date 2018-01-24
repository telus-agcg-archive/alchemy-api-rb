require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'
require 'vcr'
require 'pry'
require 'coveralls'

Coveralls.wear!
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

files = File.join(File.dirname(__FILE__), '../lib/alchemy_api')
require File.expand_path(files)

API_KEY = ENV['ALCHEMY_API_KEY']

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('ALCHEMY_KEY') { API_KEY }
end
