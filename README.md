# Infrataster::Plugin::Dns

DNS plugin for Infrataster with [rspec-dns](https://github.com/spotify/rspec-dns).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'infrataster-plugin-dns'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install infrataster-plugin-dns

## Usage

The usage is as same as [Infrataster](https://github.com/ryotarai/infrataster).

You can use `have_entry` matcher as an alternative of
[rspec-dns](https://github.com/spotify/rspec-dns) `have_dns` matcher.
You can also use all chains for `have_dns` matcher.

```ruby
require 'infrataster-plugin-dns'

describe server(:dns) do
  describe dns('www.example.com') do
    it { is_expected.to have_entry.with_type('A').and_address('192.0.2.4') }
  end
  describe dns('192.0.2.4') do
    it do
      is_expected.to have_entry.with_type('PTR')
        .and_domainname('www.example.com')
    end
  end
end
```

You can get following result:

```
$ bundle exec rspec

server 'dns'
  dns 'www.example.com'
    should have the correct dns entries with {:type=>"A", :address=>"192.0.2.4"}
  dns '192.0.2.4'
    should have the correct dns entries with {:type=>"PTR", :domainname=>"www.example.com"}

Finished in 0.03599 seconds (files took 0.93903 seconds to load)
2 examples, 0 failures
$
```


## Contributing

1. Fork it ( https://github.com/otahi/infrataster-plugin-dns/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
