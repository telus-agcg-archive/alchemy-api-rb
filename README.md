# AlchemyAPI

This is a Ruby Client Library that provides access to the Alchemy text mining API. The initial version targets the following API's:

* Keyword Extraction
* Text Extraction
* Entity Extraction
* Sentiment Analysis
* Concept Tagging
* Text Categorization
* Language Detection
* Author Extraction

Not yet implemented API's:

* Content Scraping
* Microformats
* RSS / ATOM

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy-api-rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alchemy-api-rb

## Usage

Set your API Key in an initializer or something similar:

    AlchemyAPI.key = "xxxxxxxxxxxxxxxxxx"

You may set the key along with other config settings:

    AlchemyAPI.configure do |config|
      config.key = "xxxxxxxxxxxxxxxxxx"
      config.output_mode = :xml # not yet supported
    end

Request keyword extraction for a string of text:

    results = AlchemyAPI.search(:keyword_extraction, :text => "hello world")

or

    results = AlchemyAPI::KeywordExtraction.search(:url => "http://www.alchemyapi.com/")

or

    results = AlchemyAPI::KeywordExtraction.search(:html => "<html><body>lorem ipsum</body></html>")

Results for keywor extraction are returned as a array of keywords:

    [
      {
             "text" => "lorem ipsum",
        "relevance" => "0.993164"
      }
    ]

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
