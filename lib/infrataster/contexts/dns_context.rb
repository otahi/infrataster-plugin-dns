require 'infrataster'
require 'rspec-dns'

module Infrataster
  module Contexts
    # Infrataster DNS context
    class DnsContext < BaseContext
      include RSpec::Matchers

      def have_entry(*args)
        have_dns.config(nameserver: server.address)
      end
    end
  end
end
