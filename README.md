# Volt::Upload

Drop-in file upload support for Volt applications.

## Installation

    git clone git@github.com:andrew-carroll/volt-upload.git

Add this line to your application's Gemfile:

    gem 'volt-upload', path: 'volt-upload'

And then execute:

    $ bundle

Add this line to your component's `dependencies.rb` file:

    component 'upload'

## Usage

    <:upload />

Uploads are stored on `store._uploads` by default. Access the data url of the most recent upload with either `page._last_upload` or `store._uploads.last._data`.

## Contributing

1. Fork it ( http://github.com/[my-github-username]/volt-upload/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
