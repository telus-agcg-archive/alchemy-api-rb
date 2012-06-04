require 'minitest/spec'
require 'minitest/autorun'
require 'turn/autorun'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/alchemy-api'))

API_KEY = File.read('./.keys').chomp
