require 'rspec'
require 'infrataster/resources'
require 'dnsruby/name'
require 'ipaddr'

module Infrataster
  module Helpers
    # Infrataster resource helper
    module ResourceHelper
      def dns(*args)
        Dns.create_target(args.first)
      end

      # Infrataster DNS resource helper
      # RSpec tend to parent's described class if described class is String
      # But rspec-dns needs String class or Dnsruby::Name class
      # To avoid using parent's decribed class, define methods to immitate
      module Dns
        def self.create_target(name)
          target = create_name(name)
          define_methods(target)
          target
        end

        private

        def self.define_methods(target)
          def target.is_a?(klass)
            super || Resources::DnsResource == klass ||
              Resources::BaseResource == klass
          end

          def target.to_s
            "dns '#{@original}'"
          end

          def target.context_class
            Contexts.const_get('DnsContext')
          end
        end

        def self.create_name(string)
          if ip?(string)
            name = Dnsruby::Name.create(IPAddr.new(string).reverse)
          else
            name = Dnsruby::Name.create(string)
          end
          name.instance_variable_set(:@original, string)
          name
        end

        def self.ip?(string)
          IPAddr.new(string)
          true
        rescue
          false
        end
      end
    end
  end
end
