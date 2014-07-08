# -*- encoding: utf-8 -*-
require File.expand_path('../lib/alchemy-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Allen"]
  gem.email         = ["john.allen@technekes.com"]
  gem.description   = %q{Provides access to the Alchemy text mining API - http://www.alchemyapi.com/}
  gem.summary       = %q{This is a ruby client library that provides access to the Alechemy text mining API. The initial version targets the keyword extraction api specificaly, with other implementations to follow.}
  gem.homepage      = "https://github.com/technekes/alchemy-api-rb"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "alchemy-api-rb"
  gem.require_paths = ["lib"]
  gem.version       = AlchemyAPI::VERSION

  gem.add_dependency             'faraday',             '~> 0.8.1'
  gem.add_dependency             'excon',               '~> 0.28.0'

  gem.add_development_dependency 'minitest',            '~> 3.1.0'
  gem.add_development_dependency 'pry',                 '~> 0.9.0'
  gem.add_development_dependency 'rake',                '~> 0.9.2'
  gem.add_development_dependency 'turn',                '~> 0.9.5'
  gem.add_development_dependency 'vcr',                 '~> 2.2.0'
  gem.add_development_dependency 'fakeweb',             '~> 1.3.0'
end
