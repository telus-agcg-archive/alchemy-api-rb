# AlchemyAPI

This is a Ruby Client Library that provides access to the Alchemy text mining API. The initial version targets these  API's specifically, with other implementations to follow.

* Keyword Extraction
* Text Extraction
* Entity Extraction
* Sentiment Analysis

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
      config.output_mode = :xml
    end

Request keyword extraction for a string of text:

    results = AlchemyAPI.search(:keyword_extraction, :text => "hello world")

or

    results = AlchemyAPI::KeywordExtraction.search(:text => "hello world")

Results are returned as a array of keywords extracted:

    [
      {
             "text" => "lorem ipsum",
        "relevance" => "0.993164"
      }
    ]

## TODO

1. Add additional Alchmey API search modes
2. Add support for raw output (JSON, XML and RDF)?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
