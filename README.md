# AlchemyAPI

This is a ruby client library that provides access to the Alechemy text mining API. The initial version targets the keyword extraction api specificaly, with other implementations to follow.

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy-api-rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alchemy-api-rb

## Usage

Create a client instances with your API Key:

    @client = AlchemyAPI::KeywordExtraction.new("xxxxxxxxxxxxxxxxxx")

Request keyword extraction for a string of text:

    results = @client.text_search("lorem ipsum")

Results are returned as a array of keywords extracted:

    [
      {
             "text" => "lorem ipsum",
        "relevance" => "0.993164"
      }
    ]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
