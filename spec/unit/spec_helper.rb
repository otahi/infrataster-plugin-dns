require 'coveralls'
Coveralls.wear!

require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '.bundle/'
end

require 'rspec'
require 'infrataster-plugin-dns'

def stub_records(strings)
  records = strings.map { |s| Dnsruby::RR.new_from_string(s) }
  resolver = Dnsruby::Resolver.new
  allow(Dnsruby::Resolver).to receive(:new) do
    yield if block_given?
    resolver
  end
  allow(resolver).to receive_message_chain(:query, :answer).and_return(records)
end
