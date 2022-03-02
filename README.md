# Notebroker

Supports turning ipynb python notebooks into the following formats:

- Markdown

This library is in alpha and might not support everything. You can see
the example file which I will make harder over time at `spec/fixtures`.

Plans are to support more formats like:

- HTML
- MDX

I wrote this library to make it easier to write blog posts through NextJS
using notebook code. Instead of dealing with the delicate javascript build
ecosystem I decided to extract it into a more sane ruby gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'notebroker'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install notebroker

## Usage

From your terminal you can run the cli:

```
notebroker --convert notebooks/my-notebook.ipynb --destination ./
...
Converting notebooks/my-notebook.ipynb into markdown...
Saved markdown file to ./
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/notebroker.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
