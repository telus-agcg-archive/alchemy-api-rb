require 'minitest/spec'
require 'minitest/autorun'
require 'turn/autorun'
require 'vcr'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/alchemy-api'))

API_KEY = File.read('./.keys').chomp

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :fakeweb
end
