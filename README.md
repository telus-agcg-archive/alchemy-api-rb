# AlchemyAPI

[![Build Status](https://secure.travis-ci.org/technekes/alchemy-api-rb.png?branch=master)](http://travis-ci.org/technekes/alchemy-api-rb)
[![Code Climate](https://codeclimate.com/github/technekes/alchemy-api-rb.png)](https://codeclimate.com/github/technekes/alchemy-api-rb)
[![Coverage Status](https://img.shields.io/coveralls/technekes/alchemy-api-rb.svg)](https://coveralls.io/r/technekes/alchemy-api-rb)
[![Dependency Status](https://gemnasium.com/connexio-labs/omniauth-connexio.png)](https://gemnasium.com/connexio-labs/omniauth-connexio)
[![Gem Version](https://badge.fury.io/rb/alchemy-api-rb.png)](http://badge.fury.io/rb/alchemy-api-rb)

This is a Ruby Client Library that provides access to the [Alchemy text mining API](http://www.alchemyapi.com/). The current version targets the following API's:

* Keyword Extraction
* Text Extraction
* Title Extraction
* Entity Extraction
* Sentiment Analysis
* Relation Extraction
* Concept Tagging
* Text Categorization
* Language Detection
* Author Extraction
* Taxonomy
* Image Tagging

Not yet implemented API's:

* Content Scraping
* Microformats
* RSS / ATOM

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy-api-rb', :require => 'alchemy_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alchemy-api-rb

## Usage

You'll need to [request an API Key](http://www.alchemyapi.com/api/register.html).

Set your API Key in an initializer or something similar:

    AlchemyAPI.key = "xxxxxxxxxxxxxxxxxx"

You may set the key along with other config settings:

    AlchemyAPI.configure do |config|
      config.apikey = "xxxxxxxxxxxxxxxxxx"
      config.output_mode = :xml # not yet supported
    end

Request keyword extraction for a string of text:

    results = AlchemyAPI.search(:keyword_extraction, :text => "hello world")

or

    results = AlchemyAPI::KeywordExtraction.new.search(:url => "http://www.alchemyapi.com/")

or

    results = AlchemyAPI::KeywordExtraction.new.search(:html => "<html><body>lorem ipsum</body></html>")

Results for keyword extraction are returned as a array of keywords:

    [
      {
             "text" => "lorem ipsum",
        "relevance" => "0.993164"
      }
    ]

## Testing

The specs are expecting your API Key as an environment variable named `ALCHEMY_API_KEY`. You can export it locally or prepend the test command like so:

    ALCHEMY_API_KEY="this-is-my-40-character-key" bundle exec rake test

If you would like to expirement with the API you can run the `console` rake task and use the commands above to set the API Key issue search commands:

    bundle exec rake console

## TODO

1. Add missing Alchmey API search modes
2. Add the ability to search all supported API's in a single request?
3. Add support for raw output (JSON, XML and RDF)?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License. See LICENSE for details.
