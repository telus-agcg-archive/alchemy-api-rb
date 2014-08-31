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

  gem.add_dependency             'faraday',             '~> 0.8.x'
  gem.add_dependency             'excon',               '~> 0.28.x'

  gem.add_development_dependency 'minitest',            '~> 5.4.x'
  gem.add_development_dependency 'pry',                 '~> 0.10.x'
  gem.add_development_dependency 'rake',                '~> 10.3.x'
  gem.add_development_dependency 'minitest-reporters',  '~> 1.0.x'
  gem.add_development_dependency 'vcr',                 '~> 2.3.x'
  gem.add_development_dependency 'webmock',             '~> 1.18.x'
  gem.add_development_dependency 'coveralls',           '~> 0.7.x'
  gem.add_development_dependency 'rubocop',             '~> 0.25.x'
end
